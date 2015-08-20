class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.integer :organization_id, null: false
      t.string :location
      t.text :description, null: false
      t.datetime :start_time, :end_time, null: false 
    end
  end
end

#Event.create!(title: 'Square Code Camp', organization: )
#Event.create!(title: 'Square Code Camp', organization: Organization.first, user: User.first, start_time: 2.hours.ago, end_time: 1.hour.ago, location: 'San Francisco', description: 'this is really fun')
