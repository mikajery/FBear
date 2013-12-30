

class DellinController < ApplicationController
  def show
    calc = DellinApi.new
    abort calc.get_price('Санкт-Петербург', 1000, 2).inspect
  end
end