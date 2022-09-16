class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  before_action :permit_params, only: [:update, :create]

  def index
    @menus=Menu.all
  end

  def show
  end

  def new
    @menu=Menu.new
  end

  def edit
  end

  def create
    @menu=Menu.new(permit_params)
    if @menu.save
      flash[:notice] = "menu created successfully"
      redirect_to menus_path
    else
      flash[:alert] = "Therer is some issue menu not created"
      render :action => 'new'
    end

  end

  def update
    if @menu.update(permit_params)
      flash[:notice] = "menu updated successfully"
      redirect_to menus_path(@menu)
    else
      flash[:alert] = "Therer is some issue menu not updated"
      render :action => "show"
    end
  end

  def destroy
    if @menu.destroy
      flash[:notice] = "menu deleted successfully"
      redirect_to menus_path
    else
      flash[:alert] = "Therer is some issue menu not deleted"
      render :action => "index"
    end
  end

  private

  def set_menu
    @menu=Menu.find(params[:id])
  end

  def permit_params
    params.require(:menu).permit(:name, :resturant_id, addon_ids: [])
  end
end
