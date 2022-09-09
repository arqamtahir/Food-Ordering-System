class AddonsController < ApplicationController

    def index
      @addons=Addon.all
    end

    def show
			@addon=Addon.find(params[:id])
    end

    def new
			@addon=Addon.new
    end

    def edit
      @addon=Addon.find(params[:id])
    end

    def create
			@addon=Addon.new(params.require(:addon).permit(:name,:description,:price,:post_status))
			@addon.save
    end

    def update
    end

    def destroy
    end
    
end
