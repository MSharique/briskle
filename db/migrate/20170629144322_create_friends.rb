class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|
      t.string :f1_username
      t.string :f2_username
      t.integer :status

      t.timestamps
    end
  end
end
