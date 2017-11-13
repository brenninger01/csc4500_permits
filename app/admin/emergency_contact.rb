ActiveAdmin.register EmergencyContact do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

	show do
  	attributes_table do
  		#id_column
  		row :last_name
  		row :first_name
  		#row :# do |faculty|
  			#link_to faculty.emergency_contact.first_name + ' '+ faculty.emergency_contact.last_name,
         #emergency_contact_path(faculty)
      #end
      	row :faculty do |emergency_contact|
      		link_to emergency_contact.faculty.first_name + " " + emergency_contact.faculty.last_name,
      			admin_faculty_path(emergency_contact.faculty_id)
      	end
      	row :address
      	row :city
      	row :state
      	row :home_phone
      	row :cell_phone
      	row :office_phone
  	end
  end
end
