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
	before_action :set_permit, only: [:show, :edit, :update, :destroy]
	filter :permit_id
	permit_params :utf8, :permit_id, :vehicle, :date_issued, :issued_by, :date_entered, :entered_by


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
  			f.input :vehicle, :collection => Vehicle.all.map{ |vehicle| [vehicle.license_number]}
  			f.input :permit_id
  			f.input :date_issued, as: :date_picker
  			f.input :issued_by
  		end
  		f.actions
  	end

	controller do
		def new
			@permit = Permit.new
    		@vehicle = @permit.build_vehicle 
    	end	

    	def create
    		 #@permit = Permit.new
    		 #vehicle = Vehicle.find_by(permitted_params[:vehicle])
    		 @vehicle = current_user.permit.build(permitted_params.merge(date_entered: Date.today, 
        		entered_by: current_admin_user.email))
    		 #@permit.update(vehicle: vehicle)
    		 #super
    	end

    	def permittted_params
    		params.require(:permit).permit!(:permit_id, :date_issued, :issued_by, :date_entered, :entered_by, :utf8, vehicle_attributes: [:license_number])
    	end

    	def set_permit
      		@permit = Permit.find(params[:id])
      	end
    end

end
