class OptionsController < ApplicationController
    before_action :set_option, only: [:show, :edit, :update, :destroy]
    before_action :permit_params, only: [:update, :create]
  
    def index
      @options=Option.all
    end
  
    def show
    end
  
    def new
      @option=Option.new
    end
  
    def edit
    end
  
    def create
      @option=Option.new(permit_params)
      if @option.save
        flash[:notice] = "option created successfully"
        redirect_to options_path, notice: "option created successfully"
      else
        flash[:alert] = "Therer is some issue option not created"
        render :new
      end
  
    end
  
    def update
      if @option.update(permit_params)
        flash[:notice] = "option updated successfully"
        redirect_to options_path(@option)
      else
        flash[:alert] = "Therer is some issue option not updated"
        render :show
      end
    end
  
    def destroy
      if @option.destroy
        flash[:notice] = "option deleted successfully"
        redirect_back(fallback_location: root_path)
      else
        flash[:alert] = "Therer is some issue option not deleted"
        render :index
      end
    end
  
    private
  
    def set_option
      @option=Option.find(params[:id])
    end
  
    def permit_params
      params.require(:option).permit(
        :name,
        :group_item_id)
    end
  end
  