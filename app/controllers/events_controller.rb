class EventsController < ApplicationController
  def index
    # call Carl's API for getting events and filter them...

    @events=ActiveSupport::JSON.decode(RestClient.get('http://54.183.116.48/events'))

  end

  def show
  end

  def new
    RestClient.post('http://54.183.116.48/events',{:title=>params[:title], :startDate=>params[:startDate],
                      :endDate=>params[:endDate], :description=>params[:description], :images=>params[:images],
                      :organization=>params[:organization], :heroImage=>params[:heroImage], :location=>params[:location],
                      :visibility=>params[:visibility], :status=>params[:status]})
  end
end
