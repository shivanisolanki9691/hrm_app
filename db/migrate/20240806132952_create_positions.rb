class CreatePositions < ActiveRecord::Migration[7.0]
  def change
    create_table :positions do |t|
      t.string :title
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
