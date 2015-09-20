class QualificationsController < ApplicationController
  before_action :set_qualification, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @qualifications = Qualification.all
    respond_with(@qualifications)
  end

  def show
    respond_with(@qualification)
  end

  def new
    @qualification = Qualification.new
    respond_with(@qualification)
  end

  def edit
  end

  def create
    @qualification = Qualification.new(qualification_params)
    @qualification.save
    respond_with(@qualification)
  end

  def update
    @qualification.update(qualification_params)
    respond_with(@qualification)
  end

  def destroy
    @qualification.destroy
    respond_with(@qualification)
  end

  private
    def set_qualification
      @qualification = Qualification.find(params[:id])
    end

    def qualification_params
      params.require(:qualification).permit(:user_id, :position_id, :status, :count)
    end
end
