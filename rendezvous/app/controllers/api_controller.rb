class ApiController < ApplicationController
  def get_location
    location = "35.23567325,12.1235634"
    render :json => location
  end
end
