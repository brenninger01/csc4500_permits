class VehiclePermitsController < ApplicationController
  before_action :set_vehicle_permit, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  after_action :verify_authorized

  # GET /permits
  # GET /permits.json
  def index
      @vehicle_permits = VehiclePermit.all
      if params[:search]
        @vehicle_permits = VehiclePermit.search(params[:search]).order("created_at DESC")
      else
        @vehicle_permits = VehiclePermit.all.order('created_at DESC')
      end
    authorize @vehicle_permits
  end

  # GET /permits/1
  # GET /permits/1.json
  def show
  end

  # GET /permits/new
  def new
    @vehicle_permit = VehiclePermit.new
    @vehicle = @vehicle_permit.build_vehicle
    @vehicle = Vehicle.all
    authorize @vehicle_permit
  end

  # GET /permits/1/edit
  def edit
    @vehicle = @vehicle_permit.build_vehicle
  end

  # POST /permits
  # POST /permits.json
  def create

    vehicle = Vehicle.find_by(license_number: vehicle_permit_params[:vehicle_attributes][:license_number])
    if current_user.faculty?
      @vehicle_permit = current_user.vehicle_permit.build(vehicle_permit_params.merge(date_entered: Date.today, 
        entered_by: current_user.faculty.first_name + " " + current_user.faculty.last_name))
      @vehicle_permit.update(vehicle: vehicle)
    elsif current_user.student?
      @vehicle_permit = current_user.vehicle_permit.build(vehicle_permit_params.merge(date_entered: Date.today,
       entered_by: current_user.student.first_name + " " + current_user.student.last_name))
      @vehicle_permit.update(vehicle: vehicle)
    end
    authorize @vehicle_permit

    respond_to do |format|
      if @vehicle_permit.save
        format.html { redirect_to @vehicle_permit, notice: 'Permit was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle_permit }
      else
        format.html { render :new }
        format.json { render json: @vehicle_permit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permits/1
  # PATCH/PUT /permits/1.json
  def update
    vehicle = Vehicle.find_by(license_number: vehicle_permit_params[:vehicle_attributes][:license_number])
    
    respond_to do |format|
      if @vehicle_permit.update(vehicle_permit_params)
        @vehicle_permit.update(vehicle: vehicle)
        format.html { redirect_to @vehicle_permit, notice: 'Permit was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle_permit }
      else
        format.html { render :edit }
        format.json { render json: @vehicle_permit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permits/1
  # DELETE /permits/1.json
  def destroy
    @vehicle_permit.destroy
    respond_to do |format|
      format.html { redirect_to permits_url, notice: 'Permit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_permit
      @vehicle_permit = VehiclePermit.find(params[:id])
      authorize @vehicle_permit
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_permit_params
      params.require(:vehicle_permit).permit(:vehicle_permit_id, :date_issued, :issued_by, :date_entered, :entered_by, vehicle_attributes: [:license_number])
    end
end
