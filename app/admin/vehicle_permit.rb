 ActiveAdmin.register VehiclePermit do
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
	permit_params :vehicle_permit_id, :vehicle, :date_issued, :issued_by, :date_entered, :entered_by,
		vehicle_attributes: [:license_number]


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
			row :vehicle_permit_id
			row :date_issued
			row :issued_by
			row :date_entered
			row :entered_by
			row :vehicle do |vehicle_permit|
				link_to vehicle_permit.vehicle.license_number, admin_vehicle_path(vehicle_permit.vehicle.vehicle_id) if vehicle_permit.vehicle.present?
			end
		end
	end

	form do |f|
		license_collection = Vehicle.all.map{ |vehicle| [vehicle.license_number] }
  		f.inputs do
  			f.has_many :vehicle, new_record: false do |veh|
  				veh.input :license_number, :collection => license_collection
  			end
  			f.input :vehicle_permit_id
  			f.input :date_issued, as: :date_picker
  			f.input :issued_by
  		end
  		f.actions
  	end

	controller do
		
		def new
        	@vehicle_permit = VehiclePermit.new
        	@vehicle = @vehicle_permit.build_vehicle 
    	end 

    	def create
    		#puts params.inspect

    		vehicle = Vehicle.find_by(license_number: permitted_params[:vehicle_permit])
    		puts vehicle.inspect
    		 #@vehicle_permit = current_user.vehicle_permit.build(vehicle_permit_params.merge(date_entered: Date.today, entered_by: current_admin_user.email)[:vehicle_permit])
    		 #@vehicle_permit.update(vehicle: vehicle)
    		 additional_params = {entered_by: current_admin_user.email, date_entered: Date.today}
    		 @vehicle_permit = current_user.vehicle_permit.build(permitted_params[:vehicle_permit].merge(additional_params))
    		 @vehicle_permit.update(vehicle: vehicle)
    		 super
    	end

    	def update
			super    		
    	end

    	def vehicle_permit_params
    		params.permit vehicle_permit: [:vehicle_permit_id, :date_issued, :issued_by, :date_entered, :entered_by,  vehicle_attributes: [:license_number]]
    	end
    end

end
