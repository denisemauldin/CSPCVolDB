class PositionsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
 
  # GET /positions
  # GET /positions.json
  def index
    @positions = Position.all
  end

  # GET /positions/1
  # GET /positions/1.json
  def show  
    @position = Position.find(params[:id])
    @trainings = Position.trainings 
  end

  # GET /positions/new
  def new
    @position = Position.new
    @trainings = Position.trainings
  end

  # GET /positions/1/edit
  def edit
    @position = Position.find(params[:id])
    @trainings = Position.trainings
  end

  # POST /positions
  # POST /positions.json
  def create
    @position = Position.new(position_params)
    @trainings = Position.trainings   
    respond_to do |format|
      if @position.save
        format.html { redirect_to @position, notice: 'Position was successfully created.' }
        format.json { render :show, status: :created, location: @position }
      else
        format.html { render :new }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /positions/1
  # PATCH/PUT /positions/1.json
  def update
    respond_to do |format|
      if @position.update(position_params)
        format.html { redirect_to @position, notice: 'Position was successfully updated.' }
        format.json { render :show, status: :ok, location: @position }
      else
        format.html { render :edit }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /positions/1
  # DELETE /positions/1.json
  def destroy
    @position.destroy
    respond_to do |format|
      format.html { redirect_to positions_url, notice: 'Position was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position
      @position = Position.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def position_params
      params.require(:position).permit(:name, :training, :shadowing, :desc)
    end
end
