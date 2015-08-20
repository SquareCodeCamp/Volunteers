class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.string :url
      t.string :tag, null: false
      t.timestamps null: false
    end
  end
end
