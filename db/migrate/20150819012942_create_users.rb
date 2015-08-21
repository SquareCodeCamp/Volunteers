class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null:false, uniqueness:true
      t.string :encrypted_password, null: false
    end
  end
end
