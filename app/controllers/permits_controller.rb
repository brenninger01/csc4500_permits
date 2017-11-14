class PermitsController < ApplicationController
  before_action :set_permit, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  after_action :verify_authorized

  # GET /permits
  # GET /permits.json
  def index
      @permits = Permit.all
      if params[:search]
        @permits = Permit.search(params[:search]).order("created_at DESC")
      else
        @permits = Permit.all.order('created_at DESC')
      end
    authorize @permits
  end

  # GET /permits/1
  # GET /permits/1.json
  def show
  end

  # GET /permits/new
  def new
    @permit = Permit.new
    authorize @permit
  end

  # GET /permits/1/edit
  def edit
  end

  # POST /permits
  # POST /permits.json
  def create
    if current_user.faculty?
      @permit = current_user.permit.build(permit_params.merge(date_entered: Date.today, entered_by: current_user.faculty.first_name + " " + current_user.faculty.last_name))
    elsif current_user.student?
      @permit = current_user.permit.build(permit_params.merge(date_entered: Date.today, entered_by: current_user.student.first_name + " " + current_user.student.last_name))
    end
    authorize @permit

    respond_to do |format|
      if @permit.save
        format.html { redirect_to @permit, notice: 'Permit was successfully created.' }
        format.json { render :show, status: :created, location: @permit }
      else
        format.html { render :new }
        format.json { render json: @permit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permits/1
  # PATCH/PUT /permits/1.json
  def update
    respond_to do |format|
      if @permit.update(permit_params)
        format.html { redirect_to @permit, notice: 'Permit was successfully updated.' }
        format.json { render :show, status: :ok, location: @permit }
      else
        format.html { render :edit }
        format.json { render json: @permit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permits/1
  # DELETE /permits/1.json
  def destroy
    @permit.destroy
    respond_to do |format|
      format.html { redirect_to permits_url, notice: 'Permit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permit
      @permit = Permit.find(params[:id])
      authorize @permit
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def permit_params
      params.require(:permit).permit(:permit_id, :date_issued, :issued_by, :date_entered, :entered_by)
    end
end
