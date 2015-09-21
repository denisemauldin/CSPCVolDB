class EventsController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => :calendar_events
  respond_to :html, :json

  def index
     @events = Event.all
    respond_to do |format|
      format.html { respond_with @events }
      format.json { render json: @events }
    end    
  end

  def calendar_events
    if params[:calendar_ids] == 'empty' then
      respond_to do |format|
        format.json { render json: [] }
      end
    else
      # expects to have a start and end date passed
      if params[:start].present? and params[:end].present? then
        @events = Event.where(nil)
        @events = @events.where(:calendar_id => params[:calendar_ids].split(',')) if params[:calendar_ids].present?
        @dates = @events.collect { |event|  event.calendar_item(params[:start], params[:end]) }.flatten()
        respond_to do |format|
          format.json { render json: @dates }
        end
      else
        @event = Event.new
        @event.errors.add(:base, "calendar_events requires :start and :end parameters")
        Rails.logger.debug("calendar_events requires :start and :end parameters #{@event.inspect}")
        respond_to do |format|
          format.json { render :json => { :errors => @event.errors.full_messages }, :status => 422 }
        end
      end
    end    
  end

  def listing
    start_date = Time.now
    end_date = start_date + 30.days
    @events = Event.where(nil)
    @events = @events.where(:calendar_id => params[:calendar_ids].split(',')) if params[:calendar_ids].present?
    @listings = Hash.new
    @list_items = Array.new
    @events.each do |event|  
      l = event.listing_item(start_date, end_date)
      @list_items << l
      Rails.logger.debug("\n l in events loop #{l.inspect}\n") 
    end
    @listings = @events.collect { |event| event.listing_item(start_date, end_date) }.inject({}) { |a,b| a.merge(b) { |_,x,y| [*x,*y] } }
  
    respond_to do |format|
      format.html { respond_with @listings }
      format.json { render json: @listings }
    end
  end

  def show
  end

  def new
    respond_with(@event)
  end

  def edit
  end

  def create
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }      
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @event.destroy
        format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity}
      end
    end
  end

  private

    def event_params
      params.require(:event).permit(:id, :name, :abbv, :open_time, :duration, :default_location, :recurring_rule, :calendar_id)
    end
end
