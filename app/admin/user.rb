ActiveAdmin.register User do
	permit_params :roles
	filter :email
end
