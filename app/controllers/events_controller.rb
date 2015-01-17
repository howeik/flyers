require 'rest_client'
class EventsController < ApplicationController
  def index
    # call Carl's API for getting events and filter them...
    RestClient.get('http://54.183.116.48/events')
  end
end
