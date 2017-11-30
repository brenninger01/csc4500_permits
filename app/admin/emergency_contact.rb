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
  		row :last_name
  		row :first_name
      row :faculty do |emergency_contact|
        link_to emergency_contact.faculty.first_name + " " + emergency_contact.faculty.last_name,
          admin_faculty_path(emergency_contact.faculty_id) if emergency_contact.faculty.present?
      end
      row :student do |emergency_contact| 
        link_to emergency_contact.student.first_name + " " + emergency_contact.student.last_name,
          admin_student_path(emergency_contact.student_id) if emergency_contact.student.present?
      end

    	row :address
    	row :city
    	row :state
    	row :home_phone
    	row :cell_phone
    	row :office_phone
  	end
    active_admin_comments
  end

  index do
    selectable_column
    id_column
    column :last_name
    column :first_name
    column :address
    column :city
    column :home_phone
    column :cell_phone
    actions
  end

end
