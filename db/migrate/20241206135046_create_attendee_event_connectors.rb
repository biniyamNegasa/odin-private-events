class CreateAttendeeEventConnectors < ActiveRecord::Migration[7.2]
  def change
    create_table :attendee_event_connectors do |t|
      t.integer :attendee_id
      t.integer :attended_event_id

      t.timestamps
    end
  end
end
