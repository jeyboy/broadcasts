if ActiveRecord::Base.connection.table_exists? 'broadcasts'
  ActiveAdmin.register Broadcasts::Broadcast, as: 'Broadcast' do
    config.sort_order = 'start_at_asc'
    config.batch_actions = false #comment this if you need batches

    controller do
      before_filter :strong_params, only: [:create, :update]

      protected
        def strong_params
          params[:broadcast]['creator'] = current_admin_user
          params.require(:broadcast).permit(
              'title',
              'content',
              'start_at(1i)',
              'start_at(2i)',
              'start_at(3i)',
              'start_at(4i)',
              'start_at(5i)',
              'end_at(1i)',
              'end_at(2i)',
              'end_at(3i)',
              'end_at(4i)',
              'end_at(5i)',
              'creator'
          )
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
