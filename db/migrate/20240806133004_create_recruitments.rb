class CreateRecruitments < ActiveRecord::Migration[7.0]
  def change
    create_table :recruitments do |t|
      t.string :job_title
      t.references :department, null: false, foreign_key: true
      t.date :posting_date
      t.date :application_deadline
      t.string :status

      t.timestamps
    end
  end
end
