class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  after_action :verify_authorized
  

  # GET /vehicles
  # GET /vehicles.json
  def index
     if current_user.admin? || current_user.editor? #checks if user is admin, if so displays all of the vehicles in database.
      @vehicles = Vehicle.all 
      if params[:search]
        @vehicles = Vehicle.search(params[:search]).order("created_at DESC")
      else
        @vehicles = Vehicle.all.order('created_at DESC')
      end
     elsif user_signed_in?
      @vehicles = Vehicle.all.where(:user_id => current_user.id) #Only displays the the users vehicle.
    else
      @vehicles = Vehicle.all
    end
    authorize @vehicles
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
    authorize @vehicle
  end

  # GET /vehicles/1/edit
  def edit
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    if current_user.student?
      @vehicle = current_user.vehicles.build(vehicle_params.merge({student_id: current_user.student.student_id})) #When creating the vehicle, it connects current logged in user to the created vehicle. 
                    #Also inputs the current logged in user student_ID or faculty_ID into the appropriate vehicle field 
    elsif current_user.faculty?
      @vehicle = current_user.vehicles.build(vehicle_params.merge({faculty_id: current_user.faculty.faculty_id}))
    end
    authorize @vehicle

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
      authorize @vehicle
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.require(:vehicle).permit(:year, :color, :make, :model, :license_number, :state_licensed, :experation_year, :permit_id, :faculty_id, :student_id)
    end
end
