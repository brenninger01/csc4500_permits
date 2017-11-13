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

	index do #defines what the index page displays
		selectable_column
	    id_column
	    column :date_issued
	    column :issued_by
	    column :date_entered
	    column :entered_by
	    actions
	end

	form do |f|
  		f.inputs do
  			f.input :user, :collection => User.all.map{ |user| [user.email]}
  			f.input :permit_id
  			f.input :date_issued
  			f.input :issued_by
  			f.input :date_entered
  			f.input :entered_by
  		end
  		f.actions
  	end

end
