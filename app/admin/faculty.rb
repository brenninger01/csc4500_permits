ActiveAdmin.register Faculty do

	filter :faculty_id
	filter :last_name
	filter :first_name
	filter :department

	index do #defines what the index page displays
		selectable_column
	    id_column
	    column :last_name
	    column :first_name
	    column :department
	    column :office
	    column :user
	    column :emergency_contact do |faculty|
	    	link_to faculty.emergency_contact.first_name + ' '+ faculty.emergency_contact.last_name, admin_emergency_contact_path(faculty.emergency_contact)
	    end
	    actions
  	end

  show do
  	attributes_table do
  		row :faculty_id
  		row :last_name
  		row :first_name
  		row :emergency_contact do |faculty|
  			link_to faculty.emergency_contact.first_name + ' '+ faculty.emergency_contact.last_name 
  		end
  	end
  end

  	form do |f|
  		f.inputs do
  			f.input :user, :collection => User.all.map{ |user| [user.email]}
  			f.input :faculty_id
  			f.input :last_name
  			f.input :first_name
  			f.input :home_address
  			f.input :city
  			f.input :state
  			f.input :zip
  		end
  		f.actions
  	end
end
