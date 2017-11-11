class EmergencyContactsController < ApplicationController
  before_action :set_emergency_contact, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  after_action :verify_authorized

  # GET /emergency_contacts
  # GET /emergency_contacts.json
  def index
    if current_user.roles == 'admin' or current_user.roles == 'editor' #checks if user is admin, if so displays all of the students in database.
      @emergency_contacts = EmergencyContact.all
    elsif user_signed_in?
      @emergency_contacts = EmergencyContact.all.where(:user_id => current_user.id) #Only displays the the users student. 
    else
      @emergency_contacts = EmergencyContact.all
    end
    authorize @emergency_contacts
  end

  # GET /emergency_contacts/1
  # GET /emergency_contacts/1.json
  def show
  end

  # GET /emergency_contacts/new
  def new
    @emergency_contact = EmergencyContact.new
    authorize @emergency_contact
  end

  # GET /emergency_contacts/1/edit
  def edit
  end

  # POST /emergency_contacts
  # POST /emergency_contacts.json
  def create
    if current_user.student?
      @emergency_contact = current_user.build_emergency_contact(emergency_contact_params.merge({student_id: current_user.student.student_id}))
    elsif current_user.faculty?
      @emergency_contact = current_user.build_emergency_contact(emergency_contact_params.merge({faculty_id: current_user.faculty.faculty_id}))  
    end
    authorize @emergency_contact

    respond_to do |format|
      if @emergency_contact.save
        format.html { redirect_to @emergency_contact, notice: 'Emergency contact was successfully created.' }
        format.json { render :show, status: :created, location: @emergency_contact }
      else
        format.html { render :new }
        format.json { render json: @emergency_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emergency_contacts/1
  # PATCH/PUT /emergency_contacts/1.json
  def update
    respond_to do |format|
      if @emergency_contact.update(emergency_contact_params)
        format.html { redirect_to @emergency_contact, notice: 'Emergency contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @emergency_contact }
      else
        format.html { render :edit }
        format.json { render json: @emergency_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emergency_contacts/1
  # DELETE /emergency_contacts/1.json
  def destroy
    @emergency_contact.destroy
    respond_to do |format|
      format.html { redirect_to emergency_contacts_url, notice: 'Emergency contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emergency_contact
      @emergency_contact = EmergencyContact.find(params[:id])
      authorize @emergency_contact
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emergency_contact_params
      params.require(:emergency_contact).permit(:last_name, :first_name, :address, :city, :state, :zip, :home_phone, :cell_phone, :office_phone, :faculty_id, :student_id)
    end
end
