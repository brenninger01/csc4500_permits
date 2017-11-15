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
		column :user
		column :emergency_contact
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
		end
		active_admin_comments
	end
end
