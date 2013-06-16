require 'action_controller'

module Broadcasts
  class BroadcastsController < ActionController::Base
    protect_from_forgery
    before_filter :authenticate_user!
    #respond_to :js

    def index
      respond_with (@broadcasts = Broadcasts::Broadcast.live(params[:count]))
    end

    def destroy
      Broadcasts::Viewing.by_viewer(current_user).where(id: params[:id]).update_all(hidden_at: (Time.zone || DateTime).now)
      render nothing: true
    end
  end
end
