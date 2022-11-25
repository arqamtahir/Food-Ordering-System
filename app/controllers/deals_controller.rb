class DealsController < ApplicationController
  before_action :set_deal, only: [:show, :edit, :update, :destroy ]
  before_action :permit_params, only: [:create, :update]

  def index
    @deals = Deal.all
    @q = Deal.ransack(params[:q])
    @deals = @q.result(distinct: true)
    if params[:q].blank?
       @deals = @q.result(distinct: true)
    end
  end

  def show
  end

  def new
    @deal = Deal.new
    @items = []
    @addons = []
    GroupItem.all.map{ |group_item| @items << {deal_itemable_id: group_item.id, deal_itemable_type: "GroupItem"}}
    FoodItem.all.map{ |food_item| @items << {deal_itemable_id: food_item.id, deal_itemable_type: "FoodItem"}}
    @deal.deal_items.build( @items.map { |item| item })
    Addon.all.map{ |addon| @addons << { addon_id: addon.id}}
    @deal.addon_items.build( @addons.map { |addon| addon})
  end

  def create
    @deal = Deal.new(permit_params)
    if @deal.save
     flash[:notice] = "Deal has been creatreed successfully"
     redirect_to deals_path(@deal)
    else
      flash[:alert] = @deal.errors.full_messages
      render :index
    end
  end

  def edit
    @items = []
    @addons = []
    FoodItem.all.map do |food_item|
      if !(@deal.deal_items.exists?(deal_itemable_id: food_item.id))
        @items << {deal_itemable_id: food_item.id, deal_itemable_type: "FoodItem"}
      end
    end

    GroupItem.all.map do |group_item|
      if !(@deal.deal_items.exists?(deal_itemable_id: group_item.id))
        @items << {deal_itemable_id: group_item.id, deal_itemable_type: "GroupItem"}
      end
    end

    @deal.deal_items.build( @items.map { |item| item })

    Addon.all.map do |addon|
      if !(@deal.addon_items.exists?(addon_id: addon.id))
        @addons << {addon_id: addon.id}
      end
    end

    @deal.addon_items.build( @addons.map { |addon| addon })
  end

  def update
    if @deal.update(permit_params)
      flash[:notice] = "Deal updated successfully"
      redirect_to deals_path(@deal)
    else
      flash[:alert] = "Therer is some issue deal not updated"
      render :show
    end
  end

  def destroy
    if @deal.discarded?
      @deal.destroy
      flash[:notice] = "Deal has been deleted, successfully"
      redirect_to deals_path
    elsif @deal.discard
      flash[:notice] = "Deal has been moved to recyclebin, successfully"
      redirect_to deals_path
    else
      flash[:alert] = "Therer is some issue deal not deleted"
      render :index
    end
  end

  def restore
    if @deal.undiscard
    flash[:notice] = "Deal has been restored successfully"
    redirect_to deals_path(@deal)
    else
      flash[:alert] = "Ther is some issues"
      render :discarded
    end
  end

  def discarded
    @q =  Deal.ransack(params[:q])
    @deals = @q.result(distinct: true).discarded
  end

  private

  def set_deal
    @deal = Deal.find(params[:id])
  end

  def permit_params
    params.require(:deal).permit(
      :name,
      :description,
      :price,
      :deal_saved,
      :post_status,
      :free_item,
      deal_items_attributes: [
        :id,
        :deal_itemable_id,
        :deal_itemable_type,
        :_destroy],
      addon_items_attributes: [
        :id,
        :addon_itemable_id,
        :addon_itemable_type,
        :addon_id,
        :_destroy
        ])
  end
end
