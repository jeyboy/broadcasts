module Broadcasting
  #before_filter :authenticate_user!

  class BroadcastsController < ApplicationController
    respond_to :js

    #TODO: add to js - app key om ajax requests

    def index
      respond_with (@broadcasts = Broadcast.lived(params[:count]))
    end

    def destroy
      #current_user
      #Viewing.where()
      render nothing: true
    end
  end
end