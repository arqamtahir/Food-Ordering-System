class GroupItemsController < ApplicationController
  before_action :set_group_item, only: [:show, :edit, :update, :destroy]
  before_action :permit_params, only: [:update, :create]

    def index
      if params.key?(:status)
        if params[:status] == "available"
          @q =  GroupItem.ransack(params[:q])
          @group_items = @q.result(distinct: true).where(post_status: 1)
        end 
        
        if params[:status] == "unavailable"
          @q =  GroupItem.ransack(params[:q])
          @group_items = @q.result(distinct: true).where(post_status: 2)
        end

        if params[:status] == "all"
          @q =  GroupItem.ransack(params[:q])
          @group_items = @q.result(distinct: true)
        end
      else
        @q =  GroupItem.ransack(params[:q])
        @group_items = @q.result(distinct: true)
      end
    end

    def show
      @options = @group_item.options
    end

    def new
			@group_item=GroupItem.new
    end

    def edit
    end

    def create
			@group_item=GroupItem.new(permit_params)
			
      if @group_item.save
        flash[:notice] = "group_item created successfully"
        redirect_to group_items_path
      else
        flash[:alert] = "Therer is some issue group_item not created"
        render :new
			end

    end

    def update
			if @group_item.update(permit_params)
        flash[:notice] = "group_item updated successfully"
        redirect_to group_items_path(@group_item)
      else
        flash[:alert] = "Therer is some issue group_item not updated"
        render :action => "show"
      end
    end

    def destroy
      if @group_item.destroy
        flash[:notice] = "group_item deleted successfully"
        redirect_to group_items_path
      else
        flash[:alert] = "Therer is some issue group_item not deleted"
        render :action => "index"
      end
    end

    private

    def set_group_item
      @group_item=GroupItem.find(params[:id])
    end

    def permit_params
      params.require(:group_item).permit(
        :name,
        :description,
        :post_status,
        options_attributes: [
          :id, 
          :name,
          :group_item_id,
          :_destroy])
    end
end
