class OptionItemsController < ApplicationController
  before_action :set_option_item, only: [:show, :edit, :update, :destroy]
  before_action :permit_params, only: [:update, :create]

  def index
  end

  def new
  end

  def edit
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end


  private

  def set_option_item
    @option_item = OptionItem.find(params[:id])
  end

  def permit_params
    params.require(:option_item).permit(
      :price,
      :food_item_id,
      :option_id)
  end
end
