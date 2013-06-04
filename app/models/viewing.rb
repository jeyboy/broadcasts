class Viewing < ActiveRecord::Base
  attr_accessible :broadcast_id, :viewer_id, :viewer_type, :hidden_at

  belongs_to :broadcast, counter_cache: :viewings_count
  belongs_to :viewer, polymorphic: true

  validates :broadcast_id, presence: true

  after_save :proceed_hidden_counter, if: :hidden_at_changed?

protected
  def proceed_hidden_counter
    broadcast.update_attributes do |obj|
      obj.hidden_viewings_count += 1
    end
  end
end