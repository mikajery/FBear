# Класс для работы с API деловых линий

require 'uri'
require 'net/http'

class DellinApi

  def initialize
    @url = URI('http://public.services.dellin.ru/calculatorService2/index.html?=')
    @result = []
  end


  # кешируем коды городов
  def get_kladrs
    params = {}
    params['request'] = 'xmlForm'

    res = Net::HTTP.start(@url.host, @url.port) do |http|
      req = Net::HTTP::Post.new(@url.path)
      req.set_form_data(params)
      response = http.request(req)
    end

    result = Hash.from_xml(res.body)
    cities = 0
    if result['data'].present? and result['data']['cities'].present? and result['data']['cities']['city'].present?
      result['data']['cities']['city'].each do |city|
        Kladr.find_or_create_by city: city['name'], code: city['codeKLADR']
        cities += 1
      end
    end

    cities
  end

  def raw
    @result
  end

  # код города
  def get_code(city)
    code = Kladr.find_by(city: city)
    code.code if code.present?
  end

  # считаем доставку
  def get_price(city, weight, volume)
    params = {}
    params['request'] = 'xmlResult'
    params['derivalPoint'] = get_code('Москва')
    params['arrivalPoint'] = get_code(city)

    params['sizedWeight'] = weight
    params['sizedVolume'] = volume

    res = Net::HTTP.start(@url.host, @url.port) do |http|
      req = Net::HTTP::Post.new(@url.path)
      req.set_form_data(params)
      response = http.request(req)
    end

    result = Hash.from_xml(res.body)
    @result << result

    if result['data'].present? and result['data']['price'].present?
      result['data']
    end
  end
end