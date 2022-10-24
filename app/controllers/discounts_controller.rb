class DiscountsController < ApplicationController
  before_action :set_discount, only: [:show, :edit, :update, :destroy, :restore]
  before_action :permit_params, only: [:update, :create]

  def index
    @q =  Discount.ransack(params[:q])
    @discounts = @q.result(distinct: true).kept

    if params[:q].blank?
      @discounts = @q.result(distinct: true).available.kept
    end
  end

  def show
  end

  def new
    @discount=Discount.new
  end

  def edit
  end

  def create
    @discount=Discount.new(permit_params)
    if @discount.save
      flash[:notice] = "discount created successfully"
      redirect_to discounts_path, notice: "discount created successfully"
    else
      flash[:alert] = "Therer is some issue discount not created"
      render :new
    end

  end

  def update
    if @discount.update(permit_params)
      flash[:notice] = "discount  updated successfully"
      redirect_to discounts_path(@discount)
    else
      flash[:alert] = "Therer is some issue discount not updated"
      render :show
    end
  end

  def destroy
    if @discount.discarded?
      flash[:notice] = "food item deleted successfully"
      redirect_to discounts_path
    elsif @discount.discard
      flash[:notice] = "food item moved to recycle bin, successfully"
      redirect_to discounts_path
    else
      flash[:alert] = "Therer is some issue discount not deleted"
      render :action => "index"
    end
  end

  def discarded
    @q = Discount.ransack(params[:q])
    @discounts = @q.result(distinct: true).discarded
  end

  def restore
    @discount.undiscard
      flash[:notice] = "food item restore successfully"
      redirect_to discounts_path(@discount)
  end

  private

  def set_discount
    @discount=Discount.find(params[:id])
  end

  def permit_params
    params.require(:discount).permit(
      :name,
      :post_status,
      :discount_type,
      :discount_percentage,
      food_item_ids: [])
  end
end
