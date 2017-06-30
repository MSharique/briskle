class AddUsedToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :used, :integer
  end
end
