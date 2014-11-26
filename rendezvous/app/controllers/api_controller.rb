class ApiController < ApplicationController
  def get_location
    render :json => params.to_json
  end
end
