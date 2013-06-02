class Broadcast < ActiveRecord::Base
  has_many :viewings, dependent: :destroy
  belongs_to :creator, polymorphic: true

  validates :creator, :title, presence: true
  validate :end_date, if: :end_at?
  validate :start_date, if: :start_at?

  scope :lived, ->(limit) {where('(current_date >= start_at OR start_at IS NULL) AND (end_at < current_date OR end_at IS NULL)', current_date: DateTime.now).limit(limit)}

protected
  def start_date
    errors(:start_at).add('Start date must be greater than current date') if start_at < DateTime.now
  end

  def end_date
    errors(:end_at).add('End date must be greater than current date') if end_at < DateTime.now
    errors(:end_at).add('End date must be greater than start date') if start_at? && end_at < start_at
  end
end
