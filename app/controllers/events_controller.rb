class EventsController < ApplicationController
  def index
    # call Carl's API for getting events and filter them...
    @events = [
      {
        'title' => 'Flyers GBM'
      },
      {
        'title' => 'Flyers Bowling Night!!!'
      }
    ]
  end

  def new

  end
end
