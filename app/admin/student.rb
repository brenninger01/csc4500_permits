ActiveAdmin.register Student do
	permit_params :student_id
	config.sort_order = 'student_id'

	filter :email
	filter :student_id
	filter :last_name
	filter :first_name
	filter :athletic_team
	filter :home_phone
	filter :cell_phone
	permit_params :student_id, :last_name, :first_name, :home_address, :home_city, :home_state,
		:home_zip, :school_year_address, :school_year_city, :school_year_zip, :room_number,
		:new_student, :returning_student, :athletic_team, :home_phone, :cell_phone


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

	form do |f|
		f.inputs do
			f.input :student_id
			f.input :last_name
			f.input :first_name
			f.input :home_address
			f.input :home_city
			f.input :home_state
			f.input :home_zip
			f.input :school_year_address
			f.input :school_year_city
			f.input :school_year_zip
			f.input :room_number
			f.input :home_phone
			f.input :cell_phone
			f.input :new_student
			f.input :returning_student
			f.input :athletic_team
		end
		f.actions
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
