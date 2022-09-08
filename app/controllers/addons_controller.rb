class AddonsController < ApplicationController

    def index
      @addons=Addon.all
    end

    def show
			@addon=Addon.find(params[:id])
    end

    def new
    end

    def edit
    end

    def create

    end

    def update
    end

    def destroy
    end
    
end
