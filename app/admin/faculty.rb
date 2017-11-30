ActiveAdmin.register Faculty do

	filter :faculty_id, label: "AU ID"
	filter :last_name
	filter :first_name
	filter :department

	index do #defines what the index page displays
		selectable_column
	    column "AU ID", :faculty_id
	    column :last_name
	    column :first_name
	    column :department
	    column :office
	    column :user
	    column :emergency_contact
	    actions
  	end

  show title: :last_name do
  	attributes_table do
  		row "AU ID" do |faculty|
        faculty.faculty_id
      end
  		row :last_name
  		row :first_name
  		row :emergency_contact do |faculty|
  			link_to faculty.emergency_contact.first_name + ' '+ faculty.emergency_contact.last_name,
         admin_emergency_contact_path(faculty.emergency_contact.contact_id) if faculty.emergency_contact.present?
      end
      row :home_address
      row :city
      row :state
      row :home_phone
      row :cell_phone
      row :office_phone
      row :new_faculty
      row :department
      row :office
      row :user
  	end
    active_admin_comments
  end

  permit_params :user, :faculty_id, :last_name, :first_name, :home_address, :city, :state, :zip, :home_phone, 
  :cell_phone, :office_phone, :new_faculty, :department, :office
  	form do |f|
  		f.inputs do   
        f.semantic_errors
  			f.input :user, :collection => User.all.map{ |user| [user.email]} 
  			f.input :faculty_id, label: "Faculty ID"
  			f.input :last_name
  			f.input :first_name
  			f.input :home_address
  			f.input :city
  			f.input :state
  			f.input :zip
        f.input :home_phone
        f.input :cell_phone
        f.input :office_phone
        f.input :new_faculty
        f.input :department
        f.input :office
        f.actions
  		end         
  	end
end
