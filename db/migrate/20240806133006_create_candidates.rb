class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.text :resume
      t.date :application_date
      t.references :recruitment, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
    add_index :candidates, :email, unique: true
  end
end
