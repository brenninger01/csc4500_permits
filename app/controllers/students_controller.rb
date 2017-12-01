class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  after_action :verify_authorized

  # GET /students
  # GET /students.json
  def index
    if current_user.roles == 'admin' or current_user.roles == 'editor' #checks if user is admin, if so displays all of the students in database.
      @students = Student.all
    elsif user_signed_in?
      @students = Student.all.where(:user_id => current_user.id) #Only displays the the users student. 
    else
      @students = Student.all
    end

    if params[:search]
        @students = Student.search(params[:search]).order("created_at DESC")
      else
        @students = Student.all.order('created_at DESC')
      end

    authorize @students
  end

  # GET /students/1
  # GET /students/1.json
  def show
    
  end

  # GET /students/new
  def new
    @student = Student.new
    authorize @student
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = current_user.build_student(student_params) #When createing the student, it connects the current logged in user to the student in the database. 
    authorize @student

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
      authorize @student
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:student_id, :last_name, :first_name, :home_address, :home_city, :home_state, :home_zip, :school_year_address, :school_year_city, :school_year_zip, :room_number, :home_phone, :cell_phone, :new_student, :returning_student, :athletic_team)
    end
end
