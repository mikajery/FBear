class WelcomeController < ApplicationController
  def index
  	render 'html/map', layout: "map"
  end
end
