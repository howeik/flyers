class EventsController < ApplicationController
  def index
    # call Carl's API for getting events and filter them...

    @events=ActiveSupport::JSON.decode(RestClient.get('http://54.183.116.48/events'))

  end

  def show
  end

  def new

  end

  def create_test
    create

    redirect_to '/'
  end

  def create
    logger.debug(params)

    @event={ :organization => '54ba385a8becb4470c45ea2c', :title=>params[:title], :startDate=>params[:startDate],:endDate=>params[:endDate],
        :description=>params[:description], :images=>params[:images],
        :heroImage=>params[:heroImage], :location=>params[:location], :visibility=>params[:visibility],
        :status=>params[:status]}
    RestClient.post 'http://54.183.116.48/events', @event
  end
end
