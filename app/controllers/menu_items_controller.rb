class MenuItemsController < ApplicationController
  before_action :set_menu_item, only: [:show, :edit, :update, :destroy]
  before_action :permit_params, only: [:update, :create]

    def index
      @menu_items=MenuItem.all
    end

    def show
    end

    def new
			@menu_item=MenuItem.new
    end

    def edit
    end

    def create
			@menu_item=MenuItem.new(permit_params)
			
      if @menu_item.save
        flash[:notice] = "menu_item created successfully"
        redirect_to menu_items_path
      else
        flash[:alert] = "Therer is some issue menu_item not created"
        render :new
			end

    end

    def update
			if @menu_item.update(permit_params)
        flash[:notice] = "menu_item updated successfully"
        redirect_to menu_items_path(@menu_item)
      else
        flash[:alert] = "Therer is some issue menu_item not updated"
        render :action => "show"
      end
    end

    def destroy
      if @menu_item.destroy
        flash[:notice] = "menu_item deleted successfully"
        redirect_to menu_items_path
      else
        flash[:alert] = "Therer is some issue menu_item not deleted"
        render :action => "index"
      end
    end

    private

    def set_menu_item
      @menu_item=MenuItem.find(params[:id])
    end

    def permit_params
      params.require(:menu_item).permit(
        :name,
        :description,
        :post_status,
        :menu_itemable_id,
        :menu_itemable_type,
        addon_ids: [])
    end
end
