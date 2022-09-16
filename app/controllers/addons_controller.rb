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
        flash[:notice] = "addon created successfully"
        redirect_to addons_path
      else
        flash[:alert] = "Therer is some issue addon not created"
        render :action => 'new'
			end

    end

    def update
			if @addon.update(permit_params)
        flash[:notice] = "addon updated successfully"
        redirect_to addons_path(@addon)
      else
        flash[:alert] = "Therer is some issue addon not updated"
        render :action => "show"
      end
    end

    def destroy
      if @addon.destroy
        flash[:notice] = "addon deleted successfully"
        redirect_to addons_path
      else
        flash[:alert] = "Therer is some issue addon not deleted"
        render :action => "index"
      end
    end

    private

    def set_addon
      @addon=Addon.find(params[:id])
    end

    def permit_params
      params.require(:addon).permit(:name,:description,:price,:post_status,menu_ids: [])
    end

end
