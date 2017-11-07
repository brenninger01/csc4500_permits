json.extract! emergency_contact, :id, :last_name, :first_name, :address, :city, :state, :zip, :home_phone, :cell_phone, :office_phone, :faculty_id, :student_id, :created_at, :updated_at
json.url emergency_contact_url(emergency_contact, format: :json)
