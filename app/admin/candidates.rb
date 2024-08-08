ActiveAdmin.register Candidate do
  permit_params :name, :email, :phone_number, :resume, :application_date, :recruitment_id, :status
  config.filters = false

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :phone_number
    column :resume do |candidate|
      if candidate.resume.attached?
        link_to 'pdf', rails_blob_path(candidate.resume, disposition: 'attachment'), target: '_blank'
      else
        'No Resume'
      end
    end
    column :application_date
    column :recruitment do |candidate|
      candidate.recruitment.job_title if candidate.recruitment
    end
    column :status
    actions
  end

  form do |f|
    f.inputs "Candidate Details" do
      f.input :name
      f.input :email
      f.input :phone_number
      f.input :resume, as: :file
      f.input :application_date, as: :datepicker
      f.input :recruitment, as: :select, collection: Recruitment.all.collect { |recruitment| [recruitment.job_title, recruitment.id] }
      f.input :status, as: :select, collection: ['Applied', 'Interviewed', 'Hired', 'Rejected']
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :phone_number
      row :resume do |candidate|
        if candidate.resume.attached?
          link_to 'pdf', rails_blob_path(candidate.resume, disposition: 'attachment'), target: '_blank'
        else
          'No Resume'
        end
      end
      row :application_date
      row :recruitment do |candidate|
        candidate.recruitment.job_title if candidate.recruitment
      end
      row :status
      row :created_at
      row :updated_at
    end
  end
end