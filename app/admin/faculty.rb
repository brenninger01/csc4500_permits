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
	    actions
  	end
end
