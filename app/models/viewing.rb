class Viewing < ActiveRecord::Base
  belongs_to :broadcast, counter_cache: :viewings_count
  belongs_to :viewer, polymorphic: true

  #TODO: Need testing on counter by condition !!!
  belongs_to :broadcast, counter_cache: :hidden_viewings_count, conditions: 'hidden_at <> NULL'
end