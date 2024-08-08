ActiveAdmin.register Employee do
  permit_params :first_name, :last_name, :email, :phone_number, :hire_date, :salary, :address, :position_id, :department_id, :password, :password_confirmation
  config.filters = false

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :phone_number
    column :hire_date
    column :salary
    column :address
    column :position
    column :department
    actions
  end

  form do |f|
    f.inputs "Employee Details" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :phone_number
      f.input :hire_date, as: :datepicker
      f.input :salary
      f.input :address
      f.input :position, as: :select, collection: Position.all.collect { |position| [position.title, position.id] }
      f.input :department, as: :select, collection: Department.all.collect { |department| [department.name, department.id] }
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :email
      row :phone_number
      row :hire_date
      row :salary
      row :address
      row :position do |employee|
        employee.position.title if employee.position
      end
      row :department do |employee|
        employee.department.name if employee.department
      end
      row :created_at
      row :updated_at
    end
  end
end
