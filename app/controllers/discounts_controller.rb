class DiscountsController < ApplicationController
  before_action :set_discount, only: [:show, :edit, :update, :destroy]
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
    if @discount.destroy
      flash[:notice] = "discount deleted successfully"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "Therer is some issue Discount data is not deleted"
      render :index
    end
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
