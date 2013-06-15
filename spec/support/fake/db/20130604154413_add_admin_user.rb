class AddAdminUser < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      t.string :email
      t.string :password
      t.string :password_confirmation

      t.timestamps
    end
  end
end
