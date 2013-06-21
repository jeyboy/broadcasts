if ActiveRecord::Base.connection.table_exists? 'broadcasts'
  ActiveAdmin.register Broadcasts::Broadcast, as: 'Broadcast' do
    config.sort_order = 'start_at_asc'
    config.batch_actions = false #comment this if you need batches

    controller do
      def permitted_params
        if params[:broadcast]
          params[:broadcast][:creator_type] ||= current_admin_user.class.name
          params[:broadcast][:creator_id] ||= current_admin_user.id
        end
        params.permit(broadcast: [:title, :content, :start_at, :end_at, :creator_type, :creator_id])
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
