ActiveAdmin.register Department do
  permit_params :name, :location
  config.filters = false
  
  index do
    selectable_column
    id_column
    column :name
    column :location
    actions
  end

  form do |f|
    f.inputs "Department Details" do
      f.input :name
      f.input :location
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :location
      row :created_at
      row :updated_at
    end
  end
end
