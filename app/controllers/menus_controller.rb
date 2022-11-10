class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy, :restore]
  before_action :permit_params, only: [:update, :create]

  def index
    @q =  current_employee.resturant.menus.ransack(params[:q])
    @menus = @q.result(distinct: true).kept
    if params[:q].blank?
      @menus = @q.result(distinct: true).available.kept
    end
  end

  def show
  end

  def new
    @menu=Menu.new
    @items = []
    Deal.all.map{|deal| @items << {menu_itemable_id: deal.id, menu_itemable_type: "Deal"}}
    GroupItem.all.map{|group_item| @items << {menu_itemable_id: group_item.id, menu_itemable_type: "GroupItem"}}
    @menu.menu_items.build( @items.map { |item| item })
  end

  def edit
    @items = []
    Deal.all.map do |deal|
      if !(@menu.menu_items.exists?(menu_itemable_id: deal.id))
        @items << {menu_itemable_id: deal.id, menu_itemable_type: "Deal"}
      end
    end

    GroupItem.all.map do |group_item|
      if !(@menu.menu_items.exists?(menu_itemable_id: group_item.id))
        @items << {menu_itemable_id: group_item.id, menu_itemable_type: "GroupItem"}
      end
    end
    @menu.menu_items.build( @items.map { |item| item })
  end

  def create
    @menu=Menu.new(permit_params)
    if @menu.save
      flash[:notice] = "menu created successfully"
      redirect_to menus_path, notice: "menu created successfully"
    else
      flash[:alert] = "Therer is some issue menu not created"
      render :new
    end

  end

  def update
    if @menu.update(permit_params)
      flash[:notice] = "menu updated successfully"
      redirect_to menus_path(@menu)
    else
      flash[:alert] = "Therer is some issue menu not updated"
      render :show
    end
  end

  def destroy
    if @menu.discarded?
      flash[:notice] = "menu has been deleted, successfully"
      redirect_to menus_path
    elsif @menu.discard
      flash[:notice] = "Menu has been moved to recyclebin, successfully"
      redirect_to menus_path
    else
      flash[:alert] = "Therer is some issue menu not deleted"
      render :index
    end
  end

  def restore
    if @menu.undiscard
    flash[:notice] = "Menu has been restored successfully"
    redirect_to menus_path(@menu)
    else
      flash[:alert] = "Ther is some issues"
      render :discarded
    end
  end

  def discarded
    @q =  current_employee.resturant.menus.ransack(params[:q])
    @menus = @q.result(distinct: true).discarded
  end

  private

  def set_menu
    @menu=Menu.find(params[:id])
  end

  def permit_params
    params.require(:menu).permit(
      :name,
      :resturant_id,
      menu_items_attributes: [
        :id,
        :menu_itemable_id,
        :menu_itemable_type,
        :_destroy ])
  end
end
