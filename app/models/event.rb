class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendee_event_connectors, foreign_key: "attended_event_id"
  has_many :attendees, through: :attendee_event_connectors, foreign_key: "attended_event_id", class_name: "User"

  validates :date, :location, presence: true
end
