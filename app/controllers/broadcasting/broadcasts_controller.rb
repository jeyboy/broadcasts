module Broadcasting
  class SuperController < ApplicationController
    def index
      @broadcasts = Broadcast.all
    end

    def destroy

    end

  #TODO   Add methods for statistic methods
  end
end