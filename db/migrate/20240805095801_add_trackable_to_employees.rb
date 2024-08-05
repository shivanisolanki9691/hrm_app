class AddTrackableToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :sign_in_count, :integer
    add_column :employees, :current_sign_in_at, :datetime
    add_column :employees, :last_sign_in_at, :datetime
    add_column :employees, :last_sign_in_ip, :string
    add_column :employees, :current_sign_in_ip, :string
  end
end
