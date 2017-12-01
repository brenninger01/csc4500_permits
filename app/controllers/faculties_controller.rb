class FacultiesController < ApplicationController
  before_action :set_faculty, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  after_action :verify_authorized

  # GET /faculties
  # GET /faculties.json
  def index
    if current_user.roles == 'admin' or current_user.roles == 'editor' #checks if user is admin, if so displays all of the faculty in database.
      @faculties = Faculty.all
    elsif user_signed_in?
      @faculties = Faculty.all.where(:user_id => current_user.id) #Only displays the the users faculty.
    else
      @faculties = Faculty.all
    end

    if params[:search]
        @faculties = Faculty.search(params[:search]).order("created_at DESC")
      else
        @faculties = Faculty.all.order('created_at DESC')
      end
    authorize @faculties
  end

  # GET /faculties/1
  # GET /faculties/1.json
  def show
    @faculties = Faculty.find(params[:id])
    @vehicles = @faculties.vehicles
  end

  # GET /faculties/new
  def new
    @faculty = Faculty.new
    authorize @faculty
  end

  # GET /faculties/1/edit
  def edit
  end

  # POST /faculties
  # POST /faculties.json
  def create
    @faculty = current_user.build_faculty(faculty_params) #When creating the faculty, it connects current logged in user to the created faculty.
    authorize @faculty

    respond_to do |format|
      if @faculty.save
        format.html { redirect_to @faculty, notice: 'Faculty was successfully created.' }
        format.json { render :show, status: :created, location: @faculty }
      else
        format.html { render :new }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faculties/1
  # PATCH/PUT /faculties/1.json
  def update
    respond_to do |format|
      if @faculty.update(faculty_params)
        format.html { redirect_to @faculty, notice: 'Faculty was successfully updated.' }
        format.json { render :show, status: :ok, location: @faculty }
      else
        format.html { render :edit }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faculties/1
  # DELETE /faculties/1.json
  def destroy
    @faculty.destroy
    respond_to do |format|
      format.html { redirect_to faculties_url, notice: 'Faculty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faculty
      @faculty = Faculty.find(params[:id])
      authorize @faculty
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def faculty_params
      params.require(:faculty).permit(:faculty_id, :last_name, :first_name, :home_address, :city, :state, :zip, :home_phone, :cell_phone, :office_phone, :new_faculty, :department, :office)
    end
end
