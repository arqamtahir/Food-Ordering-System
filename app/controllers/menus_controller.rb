class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  before_action :permit_params, only: [:update, :create]

  def index
    @q =  current_employee.resturant.menus.ransack(params[:q])
    @menus = @q.result(distinct: true)
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
    if @menu.destroy
      flash[:notice] = "menu deleted successfully"
      redirect_to menus_path
    else
      flash[:alert] = "Therer is some issue menu not deleted"
      render :index
    end
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
