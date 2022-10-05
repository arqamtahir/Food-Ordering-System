class FoodItemsController < ApplicationController
  before_action :set_food_item, only: [:show, :edit, :update, :destroy]
  before_action :permit_params, only: [:update, :create]

  def index
    if params.key?(:status)
      if params[:status] == "available"
        @q =  FoodItem.ransack(params[:q])
        @food_items = @q.result(distinct: true).where(post_status: 1)
      end 
      
      if params[:status] == "unavailable"
        @q =  FoodItem.ransack(params[:q])
        @food_items = @q.result(distinct: true).where(post_status: 2)
      end

      if params[:status] == "all"
        @q =  FoodItem.ransack(params[:q])
        @food_items = @q.result(distinct: true)
      end
    else
      @q =  FoodItem.ransack(params[:q])
      @food_items = @q.result(distinct: true)
    end
  end

  def show
  end

  def new
    @food_item=FoodItem.new
  end

  def edit
  end

  def create
    @food_item=FoodItem.new(permit_params)
    
    if @food_item.save
      flash[:notice] = "Food Item created successfully"
      redirect_to food_items_path
    else
      flash[:alert] = "Therer is some issue Food Item not created"
      render :new
    end

  end

  def update
    if @food_item.update(permit_params)
      flash[:notice] = "food_item updated successfully"
      redirect_to food_items_path(@food_item)
    else
      flash[:alert] = "Therer is some issue food_item not updated"
      render :action => "show"
    end
  end

  def destroy
    if @food_item.destroy
      flash[:notice] = "food_item deleted successfully"
      redirect_to food_items_path
    else
      flash[:alert] = "Therer is some issue food_item not deleted"
      render :action => "index"
    end
  end

  private

  def set_food_item
    @food_item=FoodItem.find(params[:id])
  end

  def permit_params
    params.require(:food_item).permit(
      :name,
      :description,
      :post_status,
      :group_item_id)
  end
end
