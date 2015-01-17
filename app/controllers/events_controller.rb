class EventsController < ApplicationController
  def index
    # call Carl's API for getting events and filter them...

    @events=ActiveSupport::JSON.decode(RestClient.get('http://54.183.116.48/events'))

    @events.each do |event|
      unless event['startDate'].nil?
        event['short_month'] = event['startDate'].to_datetime.strftime('%b')
        event['day'] = event['startDate'].to_datetime.day
      end
    end

    logger.debug @events
  end

  def show
    @event = ActiveSupport::JSON.decode(RestClient.get('http://54.183.116.48/events/' + params[:id]))
  end

  def new

  end

  def create_test
    create

    redirect_to '/'
  end

  def create
    logger.debug(params)

    @event={ :organization => params[:organization], :title=>params[:title], :startDate=>params[:startDate],:endDate=>params[:endDate],
        :description=>params[:description], :images=>params[:images], :contact=>params[:contact],
        :heroImage=>params[:heroImage], :location=>params[:location], :visibility=>params[:visibility],
        :status=>params[:status]}
    RestClient.post 'http://54.183.116.48/events', @event
  end
end
