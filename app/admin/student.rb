ActiveAdmin.register Student do
	permit_params :student_id
	config.sort_order = 'student_id'

	filter :email

	index do #defines what the index page displays
		selectable_column
		id_column
		column :last_name
		column :first_name
		column :home_address
		column :home_city
		column :home_phone
		column :cell_phone
		actions
	end

	show title: :last_name do
		attributes_table do
			row "AU ID" do |student|
				student.student_id
			end
			row :last_name 
			row :first_name
			row :home_address
			row :home_city
			row :home_state
			row :home_zip
			row :school_year_address
			row :school_year_city
			row :school_year_zip
			row :room_number
			row :home_phone
			row :cell_phone
			row :new_student
			row :returning_student
			row :athletic_team
			row :emergency_contact do |student|
				link_to student.emergency_contact.first_name + " " + student.emergency_contact.last_name,
					admin_emergency_contact_path(student.emergency_contact.contact_id) if student.emergency_contact.present?
			end
		end
		active_admin_comments
	end
end
