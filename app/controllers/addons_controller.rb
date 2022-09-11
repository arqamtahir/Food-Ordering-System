class AddonsController < ApplicationController
  before_action :set_addon, only: [:show, :edit, :update, :destroy]
  before_action :permit_params, only: [:update, :create]

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
			@addon=Addon.new(permit_params)
			if @addon.save
        redirect_to addons_path
			end

    end

    def update
			@addon.update(permit_params)
      redirect_to addons_path(@addon)
    end

    def destroy
      @addon.destroy
      redirect_to addons_path
    end

    private

    def set_addon
      @addon=Addon.find(params[:id])
    end

    def permit_params
      params.require(:addon).permit(:name,:description,:price,:post_status)
    end

end
