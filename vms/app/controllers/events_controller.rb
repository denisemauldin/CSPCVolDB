class EventsController < ApplicationController
  load_and_authorize_resource
  respond_to :html

  def index
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
      params.require(:event).permit(:id, :name, :abbv, :start, :duration, :default_location, :recurring_schedule)
    end
end
