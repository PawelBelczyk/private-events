class Event < ApplicationRecord
  belongs_to :creator,
  class_name: "User"

  has_many :event_attendances,
         foreign_key: :attendee_id,
         dependent: :destroy

has_many :attendees,
         through: :event_attendances,
         source: :attendee

          scope :past, -> { where("date < ?", Time.current) }
  scope :upcoming, -> { where("date >= ?", Time.current) }
end
