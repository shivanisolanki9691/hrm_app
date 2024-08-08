ActiveAdmin.register Recruitment do
  permit_params :job_title, :department_id, :posting_date, :application_deadline, :status
  config.filters = false

  index do
    selectable_column
    id_column
    column :job_title
    column :department
    column :posting_date
    column :application_deadline
    column :status
    actions
  end

  form do |f|
    f.inputs "Recruitment Details" do
      f.input :job_title
      f.input :department, as: :select, collection: Department.all.collect { |d| [d.name, d.id] }
      f.input :posting_date, as: :datepicker
      f.input :application_deadline, as: :datepicker
      f.input :status, as: :select, collection: ['Open', 'Closed']
    end
    f.actions
  end

  show do
    attributes_table do
      row :job_title
      row :department
      row :posting_date
      row :application_deadline
      row :status
      row :created_at
      row :updated_at
    end
  end
end