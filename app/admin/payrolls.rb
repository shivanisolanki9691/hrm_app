ActiveAdmin.register Payroll do
  permit_params :employee_id, :salary_date, :basic_salary, :bonus, :deductions, :net_salary
  config.filters = false

  index do
    selectable_column
    id_column
    column :employee
    column :salary_date
    column :basic_salary
    column :bonus
    column :deductions
    column :net_salary
    actions
  end

  form do |f|
    f.inputs "Payroll Details" do
      f.input :employee, as: :select, collection: Employee.all.collect { |e| [e.full_name, e.id] }
      f.input :salary_date, as: :datepicker
      f.input :basic_salary
      f.input :bonus
      f.input :deductions
      f.input :net_salary
    end
    f.actions
  end

  show do
    attributes_table do
      row :employee
      row :salary_date
      row :basic_salary
      row :bonus
      row :deductions
      row :net_salary
      row :created_at
      row :updated_at
    end
  end
end
