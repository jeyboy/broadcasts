module Broadcasts
  class Viewing < ::ActiveRecord::Base
    self.table_name = 'viewings'

    scope :by_viewer, ->(man) { where(viewer_type: man.class.name, viewer_id: man.id)}

    attr_accessible :broadcast_id, :viewer_id, :viewer_type, :hidden_at

    belongs_to :broadcast, counter_cache: :viewings_count
    belongs_to :viewer, polymorphic: true

    validates :broadcast_id, presence: true

    after_save ->(object) { object.proceed_hidden_counter(object.hidden_at? ? 1 : -1) },
               if: :hidden_at_changed?

    after_save :update_impressions, if: :impressions_changed?

    after_destroy ->(object) { object.proceed_hidden_counter(-1) }

  protected
    def proceed_hidden_counter(offset)
      #parameters = ActionController::Parameters.new({ hidden_viewings_count: broadcast.hidden_viewings_count + offset })
      #broadcast.update_attributes(parameters.permit(:hidden_viewings_count))

      broadcast.hidden_viewings_count = broadcast.hidden_viewings_count + offset
      broadcast.save
    end

    def update_impressions
      #broadcast.update_attributes(impressions: broadcast.impressions + (impressions - impressions_was))

      broadcast.impressions = broadcast.impressions + (impressions - impressions_was)
      broadcast.save
    end
  end
end