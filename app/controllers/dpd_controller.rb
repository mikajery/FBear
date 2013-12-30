class DpdController < ApplicationController
  def show
    calc = DpdApi.new
    abort calc.get_price('Санкт-Петербург', 5, 1)
  end
end