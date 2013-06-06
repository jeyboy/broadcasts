module Broadcasts
  class BroadcastsController < ApplicationController
    before_filter :authenticate_user!
    respond_to :js

    #TODO: add to js - app key om ajax requests

    def index
      respond_with (@broadcasts = Broadcast.live(params[:count]))
    end

    def destroy

      i = 0
      #current_user
      #Viewing.where()
      render nothing: true
    end
  end
end