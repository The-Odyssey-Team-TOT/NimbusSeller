class RemoveEmailFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :email, default: 0, null: false
  end
end
