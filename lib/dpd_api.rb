# Класс для работы с API PDP

require 'uri'
require 'net/http'
require 'savon'

class DpdApi

  def initialize
    @client = Savon.client(wsdl: "http://ws.dpd.ru/services/calculator2?wsdl")
    @errors = nil
  end

  def raw
    @errors
  end

  # считаем доставку
  def get_price(request_params)
    response = @client.call(:get_service_cost) do
      message request: request = {
          auth: {
              # номер клиента
              clientNumber: '1001030673',

              # API-ключ
              clientKey: 'CCA7DE85C0B00F859D50F7CDE5A129C278D499DD'
          },
          pickup: {
              cityName: 'Москва'
          },
          delivery: {
              cityName: request_params['city'],
          },

          selfPickup: false,
          selfDelivery: false,

          weight: request_params['weight'],
          volume: request_params['volume'],

          #DPD Consumer
          serviceCode: 'CSM'
      }
    end

    response.body[:get_service_cost_response][:return][:cost]
  end
end