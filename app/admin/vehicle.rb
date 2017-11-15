ActiveAdmin.register Vehicle do
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

	permit_params :user, :year, :color, :make, :make, :model, :license_number, :state_licensed, :experation_year, :permit_id, :student_id, :faculty_id

	form do |f|
  		f.inputs do
  			f.input :user, :collection => User.all.map{ |user| [user.email]}
  			f.input :year
  			f.input :color, as: :string
  			f.input :make
  			f.input :model
  			f.input :license_number
  			f.input :state_licensed
  			f.input :experation_year
  			f.input :permit_id, :collection => Permit.all.map{ |permit| [permit.permit_id]}
  			f.input :student_id, :collection => Student.all.map{ |student| [student.student_id]}
  			f.input :faculty_id, :collection => Faculty.all.map{ |faculty| [faculty.faculty_id]}, :optional => true

  		end
  		f.actions
  	end

    show do
      attributes_table do
        row :vehicle_id
        row :user
        row :year
        row :color
        row :make
        row :model
        row :license_number
        row :state_licensed
        row :experation_year
        row :permit
        row :student
        row :faculty do |vehicle|
          if vehicle.faculty.present?
            link_to vehicle.faculty.first_name + " " + vehicle.faculty.last_name,
             admin_faculty_path(vehicle.faculty_id)
          end
        end
      end
      active_admin_comments
    end

end
