class Broadcasts::Broadcast < ActiveRecord::Base
  attr_accessible :title, :content, :start_at, :end_at, :creator, :hidden_viewings_count

  has_many :viewings, dependent: :destroy
  belongs_to :creator, polymorphic: true

  validates :creator, :title, presence: true
  validate :end_date, if: :end_at?
  validate :start_date, if: :start_at?

  scope :live, ->(limit) {where('(:current_date >= start_at OR start_at IS NULL) AND (end_at > :current_date OR end_at IS NULL)', current_date: Time.zone.now).limit(limit)}

protected
  def start_date
    errors.add(:start_at, :greater_than_current) if start_at < Time.zone.now
  end

  def end_date
    errors.add(:end_at, :greater_than_current) if end_at < Time.zone.now
    errors.add(:end_at, :greater_than_start) if start_at? && end_at < start_at
  end
end
