class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @calendars = Calendar.all
    respond_to do |format|
      format.html { respond_with @calendars }
      format.json { render json: @calendars }
    end    
  end
  


  def show
    respond_with(@calendar)
  end

  def new
    @calendar = Calendar.new
    respond_with(@calendar)
  end

  def edit
  end

  def create
    authorize! :create, Calendar
    @calendar = Calendar.new(calendar_params)
    @calendar.save
    respond_with(@calendar)
  end

  def update
    authorize! :update, Calendar
    @calendar.update(calendar_params)
    respond_with(@calendar)
  end

  def destroy
    authorize! :destroy, Calendar
    @calendar.destroy
    respond_with(@calendar)
  end

  private
    def set_calendar
      @calendar = Calendar.find(params[:id])
    end

    def calendar_params
      params.require(:calendar).permit(:name, :description, :color)
    end
end
