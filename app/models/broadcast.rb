class Broadcast < ActiveRecord::Base
  has_many :viewings, dependent: :destroy
  belongs_to :creator, polymorphic: true

  scope :lived, ->(limit) {where('(current_date >= start_at OR start_at IS NULL) AND (end_at < current_date OR end_at IS NULL)', current_date: DateTime.now).limit(limit)}
end