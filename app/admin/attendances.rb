ActiveAdmin.register Attendance do
  permit_params :employee_id, :date, :clock_in, :clock_out
  config.filters = false

  # Index view
  index do
    selectable_column
    id_column
    column :employee do |attendance|
      attendance.employee.full_name if attendance.employee
    end
    column :date
    column :clock_in
    column :clock_out
    actions
  end

  # Form view
  form do |f|
    f.inputs "Attendance Details" do
      f.input :employee, as: :select, collection: Employee.all.collect { |employee| [employee.full_name, employee.id] }
      f.input :date, as: :datepicker
      f.input :clock_in, as: :datetime_picker
      f.input :clock_out, as: :datetime_picker
    end
    f.actions
  end

  # Show view
  show do
    attributes_table do
      row :employee do |attendance|
        attendance.employee.full_name if attendance.employee
      end
      row :date
      row :clock_in
      row :clock_out
      row :created_at
      row :updated_at
    end
  end
end
