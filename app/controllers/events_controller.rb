class EventsController < ApplicationController
  def index
    @my_logger ||= Logger.new("#{Rails.root}/log/debug.log")
    @my_logger.info "note #{params}"
    if params[:search]
      @events = Event.where('lower(name) like ?', "%#{params[:search].downcase}%")
    else
      @events = Event.all
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end
