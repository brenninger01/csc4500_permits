json.extract! faculty, :faculty_id, :last_name, :first_name, :home_address, :city, :state, :zip, :home_phone, :cell_phone, :office_phone, :new_faculty, :department, :office, :created_at, :updated_at
json.url faculty_url(faculty, format: :json)
