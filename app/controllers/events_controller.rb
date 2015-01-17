class EventsController < ApplicationController
  def index
    # call Carl's API for getting events and filter them...

    @events=ActiveSupport::JSON.decode(RestClient.get('http://54.183.116.48/events'))

  end

  def new
    
  end
end
