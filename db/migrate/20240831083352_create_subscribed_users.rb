class CreateSubscribedUsers < ActiveRecord::Migration[7.0] # Adjust the version if needed
  def change
    create_table :subscribed_users do |t|
      t.string :name
      t.string :email, null: false, unique: true
      t.timestamps
    end

    add_index :subscribed_users, :email, unique: true
  end
end
