class EventsController < ApplicationController
  load_and_authorize_resource
  respond_to :html

  def index
    respond_with(@events)
  end

  def show
    respond_with(@event)
  end

  def new
    respond_with(@event)
  end

  def edit
    #@event.recurring_schedule = IceCube::Schedule.from_yaml(@event.recurring_schedule)
  end

  def create
    Rails.logger.debug("create event is #{@event.inspect}")
    if @event.save then
      redirect_to events_url, notice: "Event successfully created"
    else
      redirect_to events_url, notice: "Event failed #{@event.inspect} #{@event.errors.messages.inspect}"
    end
    #respond_with(@event)
  end

  def update
    @event.update(event_params)
    @event.save_schedule(params[:recurring_schedule])  
    respond_with(@event)
  end

  def destroy
    authorize! :destroy, @event
    begin
      Rails.logger.debug("destorying event #{@event.inspect}")
      @event.destroy
      respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
    rescue Exception
      flash[:error] = "Error destroying #{@event.inspect}"
         respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event failed to be destroyed #{@event.inspect}.' }
      format.json { head :no_content }
    end
    end
 
  end

  private
 #   def set_event
 #     @event = Event.find(params[:id])
 #     Rails.logger.debug("set event to #{@event.inspect}")
 #   end

    def event_params
      params.require(:event).permit(:name, :abbv, :start, :duration, :default_location, :recurring_schedule)
    end
end
