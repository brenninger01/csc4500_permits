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

	permit_params :user, :year, :color, :make, :make, :model, :license_number, :state_licensed, :experation_year, :vehicle_permit_id, :student_id, :faculty_id

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
  			f.input :vehicle_permit_id, :collection => VehiclePermit.all.map{ |permit| [permit.vehicle_permit_id]}, :optional => true, include_blank: true
  			f.input :student_id, :collection => Student.all.map{ |student| [student.student_id]}, :optional => true, include_blank: true
  			f.input :faculty_id, :collection => Faculty.all.map{ |faculty| [faculty.faculty_id]}, :optional => true, include_blank: true

  		end
  		f.actions
  	end

    show title: :license_number  do
      attributes_table do
        row :vehicle_id
        row "License" do |vehicle|
          vehicle.license_number
        end
        row :user
        row :year
        row :color
        row :make
        row :model
        row :state_licensed
        row "Expiration year" do |vehicle|
          vehicle.experation_year
        end
        row :vehicle_permit
        row :student do |vehicle|
          if vehicle.student.present?
            link_to vehicle.student.first_name + " " + vehicle.student.last_name,
              admin_faculty_path(vehicle.student_id)
          end
        end
        row :faculty do |vehicle|
          if vehicle.faculty.present?
            link_to vehicle.faculty.first_name + " " + vehicle.faculty.last_name,
             admin_faculty_path(vehicle.faculty_id)
          end
        end
      end
      active_admin_comments
    end

    index do
      selectable_column
      id_column
      column :year
      column :color
      column :make
      column :model
      column :license_number
      actions
    end

    controller do
      def save_resource(object)
        if object.vehicle_permit_id = ''
          object.vehicle_permit_id = nil
        end
        if object.student_id = ''
          object.student_id = nil
        end
        if object.faculty_id = ''
          object.faculty_id = nil
        end
        super
      end
    end

end
