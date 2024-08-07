class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.references :employee, null: false, foreign_key: true
      t.date :date
      t.time :clock_in
      t.time :clock_out

      t.timestamps
    end
  end
end
