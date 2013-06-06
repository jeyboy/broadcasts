if defined? Broadcast
  ActiveAdmin.register Broadcast do
    config.sort_order = 'start_at_asc'
    config.batch_actions = false #comment this if you need batches

    controller do
      def create
        params[:broadcast][:creator] = current_admin_user
        create!
      end
    end

    index do
      column :creator
      column :title
      column :content
      column :start_at
      column :end_at
      column :viewings_count
      column :hidden_viewings_count
      column :impressions

      default_actions
    end

    form do |f|
      f.inputs do
        f.input :title
        f.input :content  #, :as => :rich  # You may use this flag if you have installed gem 'rich'
        f.input :start_at
        f.input :end_at
      end
      f.actions
    end
  end
end
