class FoodItemsController < ApplicationController
  before_action :set_food_item, only: [:show, :edit, :update, :destroy, :restore]
  before_action :permit_params, only: [:update, :create]

  def index
    @q =  FoodItem.ransack(params[:q])
    @food_items = @q.result(distinct: true).kept
    
    if params[:q].blank? 
      @food_items = @q.result(distinct: true).available.kept
    end
  end

  def show
  end

  def new
    # render json: { html: render_to_string(partial: 'options') }
    @items_list = {}
    GroupItem.all.map { |item| @items_list[item.name] = item.options }
    @items_list = @items_list.to_json
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
      if @food_item.discarded?
        flash[:notice] = "food item deleted successfully"
        redirect_to food_items_path      
      elsif @food_item.discard
        flash[:notice] = "food item moved to recycle bin, successfully"
        redirect_to food_items_path
      else
        flash[:alert] = "Therer is some issue food_item not deleted"
        render :action => "index"
      end
    end

    def discarded
      @q = FoodItem.ransack(params[:q])
      @food_items = @q.result(distinct: true).discarded
    end

    def restore
      @food_item.undiscard
        flash[:notice] = "food item restore successfully"
        redirect_to food_items_path(@food_item)  
    end

    def select_option
      @group_item = GroupItem.find(params[:group_item_id])
      @form_id = params[:form_id]
      @select_option = @group_item.options
      @total_options = @select_option.count
      # @select_option = @group_item.options.name
      @group_item = @group_item.name
      
      if @select_option
        respond_to do |format|
          format.js { render partial: 'food_items/select_option', locals: {
            total_options:  @total_options,
            group_item: @group_item,
            select_option: @select_option,
            form_id: @form_id}
          }
        end
      else 
        flash[:alert] = "There is some issue please try again"
        redirect_to food_items_path
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
      :group_item_id,
      option_items_attributes: [
        :id, 
        :price,
        :food_item_id,
        :option_id,
        :_destroy])
  end
end
