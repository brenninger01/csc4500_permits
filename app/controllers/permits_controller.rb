class VehiclePermitsController < ApplicationController
  before_action :set_vehiclepermit, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  after_action :verify_authorized

  # GET /permits
  # GET /permits.json
  def index
      @vehiclepermits = VehiclePermit.all
      if params[:search]
        @vehiclepermits = VehiclePermit.search(params[:search]).order("created_at DESC")
      else
        @vehiclepermits = VehiclePermit.all.order('created_at DESC')
      end
    authorize @vehiclepermits
  end

  # GET /permits/1
  # GET /permits/1.json
  def show
  end

  # GET /permits/new
  def new
    @vehiclepermit = VehiclePermit.new
    @vehicle = @vehiclepermit.build_vehicle
    @vehicle = Vehicle.all
    authorize @vehiclepermit
  end

  # GET /permits/1/edit
  def edit
    @vehicle = @vehiclepermit.build_vehicle
  end

  # POST /permits
  # POST /permits.json
  def create

    vehicle = Vehicle.find_by(license_number: permit_params[:vehicle_attributes][:license_number])
    if current_user.faculty?
      @vehiclepermit = current_user.vehiclepermit.build(permit_params.merge(date_entered: Date.today, 
        entered_by: current_user.faculty.first_name + " " + current_user.faculty.last_name))
      @vehiclepermit.update(vehicle: vehicle)
    elsif current_user.student?
      @vehiclepermit = current_user.vehiclepermit.build(permit_params.merge(date_entered: Date.today,
       entered_by: current_user.student.first_name + " " + current_user.student.last_name))
      @vehiclepermit.update(vehicle: vehicle)
    end
    authorize @permit

    respond_to do |format|
      if @vehiclepermit.save
        format.html { redirect_to @vehiclepermit, notice: 'Permit was successfully created.' }
        format.json { render :show, status: :created, location: @vehiclepermit }
      else
        format.html { render :new }
        format.json { render json: @vehiclepermit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permits/1
  # PATCH/PUT /permits/1.json
  def update
    vehicle = Vehicle.find_by(license_number: permit_params[:vehicle_attributes][:license_number])
    
    respond_to do |format|
      if @vehiclepermit.update(permit_params)
        @vehiclepermit.update(vehicle: vehicle)
        format.html { redirect_to @vehiclepermit, notice: 'Permit was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehiclepermit }
      else
        format.html { render :edit }
        format.json { render json: @vehiclepermit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permits/1
  # DELETE /permits/1.json
  def destroy
    @vehiclepermit.destroy
    respond_to do |format|
      format.html { redirect_to permits_url, notice: 'Permit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permit
      @vehiclepermit = Permit.find(params[:id])
      authorize @vehiclepermit
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def permit_params
      params.require(:vehiclepermit).permit(:permit_id, :date_issued, :issued_by, :date_entered, :entered_by, vehicle_attributes: [:license_number])
    end
end
