require 'action_controller'

module Broadcasts
  class BroadcastsController < ActionController::Base
    protect_from_forgery
    before_filter :authenticate_user!
    #respond_to :js

    def index
      respond_with (@broadcasts = Broadcasts::Broadcast.broadcast_list(current_user, params[:count]))
    end

    def destroy
      Broadcasts::Viewing.by_viewer(current_user).where(broadcast_id: params[:id]).each(&:hide)
      render nothing: true
    end
  end
end
