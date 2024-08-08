ActiveAdmin.register Leave do
  permit_params :employee_id, :start_date, :end_date, :leave_type, :status
  config.filters = false

  index do
    selectable_column
    id_column
    column :employee do |leave|
      leave.employee.full_name if leave.employee
    end
    column :start_date
    column :end_date
    column :leave_type
    column :status
    actions
  end


  form do |f|
    f.inputs "Leave Details" do
      f.input :employee, as: :select, collection: Employee.all.collect { |employee| [employee.full_name, employee.id] }
      f.input :start_date, as: :datepicker
      f.input :end_date, as: :datepicker
      f.input :leave_type, as: :select, collection: ['Sick Leave', 'Vacation', 'Personal Leave', 'Other']
      f.input :status, as: :select, collection: ['Pending', 'Approved', 'Rejected']
    end
    f.actions
  end


  show do
    attributes_table do
      row :employee do |leave|
        leave.employee.full_name if leave.employee
      end
      row :start_date
      row :end_date
      row :leave_type
      row :status
      row :created_at
      row :updated_at
    end
  end
end
