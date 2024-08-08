ActiveAdmin.register Performance do
  permit_params :employee_id, :review_date, :rating, :comments
  config.filters = false

  index do
    selectable_column
    id_column
    column :employee
    column :review_date
    column :rating
    column :comments
    actions
  end

  form do |f|
    f.inputs "Performance Details" do
      f.input :employee, as: :select, collection: Employee.all.collect { |e| [e.full_name, e.id] }
      f.input :review_date, as: :datepicker
      f.input :rating
      f.input :comments
    end
    f.actions
  end

  show do
    attributes_table do
      row :employee
      row :review_date
      row :rating
      row :comments
      row :created_at
      row :updated_at
    end
  end
end
