class AddonsController < ApplicationController
  before_action :set_addon, only: [:show, :edit, :update, :destroy]

    def index
      @addons=Addon.all
    end

    def show
    end

    def new
			@addon=Addon.new
    end

    def edit
    end

    def create
			@addon=Addon.new(params.require(:addon).permit(:name,:description,:price,:post_status))
			@addon.save
    end

    def update
			@addon.update(params.require(:addon).permit(:name,:description,:price,:post_status))
    end

    def destroy
      @addon.destroy
    end

    private

    def set_addon
      @addon=Addon.find(params[:id])
    end

end
