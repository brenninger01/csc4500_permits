ActiveAdmin.register User do
	permit_params :roles, :password, :password_confirmation, :position
	filter :email
  filter :roles

	index do
    selectable_column
    id_column
    column :email
    column :last_sign_in_at
    column :sign_in_count
    column :roles
    column :position
    actions
  end

	 form do |f|
    	f.inputs do
      	f.input :email
      	f.input :password
      	f.input :password_confirmation
      	f.input :roles, :as => :select, :collection => ["standard", "editor", "admin"]
        f.input :position, :as => :select, :collection => ["Student", "Faculty"]
    	end
    	f.actions
  	end

  controller do #allows the password fields to be blank and update the user email 
		def update_resource(object, attributes)
  		update_method = attributes.first[:password].present? ? :update_attributes : :update_without_password
  		object.send(update_method, *attributes)
		end
	end

  show do
    attributes_table do
      row :email
      row :roles
      row :position
      row :last_sign_in_at
      row :created_at
      row :updated_at
      row :last_sign_in_ip
    end
  end

end
