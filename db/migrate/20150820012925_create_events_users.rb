class CreateEventsUsers < ActiveRecord::Migration
  def change
    create_table :events_users do |t|
    	t.integer :event_id, :user_id, null: false
    end
  end
end
