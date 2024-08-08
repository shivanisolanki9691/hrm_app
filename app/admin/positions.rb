ActiveAdmin.register Position do
  permit_params :title, :department_id
  config.filters = false

  index do
    selectable_column
    id_column
    column :title
    column :department do |position|
      position.department.name if position.department
    end
    actions
  end

  form do |f|
    f.inputs "Position Details" do
      f.input :title
      f.input :department, as: :select, collection: Department.all.collect { |department| [department.name, department.id] }
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :department do |position|
        position.department.name if position.department
      end
      row :created_at
      row :updated_at
    end
  end
end
