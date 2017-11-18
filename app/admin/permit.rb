 ActiveAdmin.register Permit do
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
	filter :permit_id
	permit_params :permit_id, :vehicle, :date_issued, :issued_by, :date_entered, :entered_by

	index do #defines what the index page displays
		selectable_column
	    id_column
	    column :date_issued
	    column :issued_by
	    column :date_entered
	    column :entered_by
	    column :vehicle
	    actions
	end

	show do
		attributes_table do
			row :permit_id
			row :date_issued
			row :issued_by
			row :date_entered
			row :entered_by
			row :vehicle do |permit|
				link_to permit.vehicle.license_number, admin_vehicle_path(permit.vehicle.vehicle_id) if permit.vehicle.present?
			end
		end
	end

	form do |f|
  		f.inputs do
  			f.input :permit_id
  			#f.input :vehicle, :collection => Vehicle.all.map{ |vehicle| [vehicle.license_number]}
  			f.input :date_issued, as :date_time_picker
  			f.input :issued_by
  			f.input :date_entered, as :date_time_picker
  			f.input :entered_by
  		end
  		f.actions
  	end

end
