ActiveAdmin.register Student do
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

end
