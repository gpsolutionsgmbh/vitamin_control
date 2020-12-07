# frozen_string_literal: true

class FoodIntakesController < ApplicationController
  before_action :set_vitamin
  respond_to :html

  def new
    @food_intake = FoodIntake.new
  end

  def create
    @vitamin_control = VitaminControlService.new(current_user, @vitamin, food_intake_params)
    @food_intake = @vitamin_control.perform_food_intake
    if @food_intake.persisted?
      redirect_to vitamin_daily_vitamin_path(@vitamin, @food_intake.daily_vitamin)
    else
      render :new
    end
  end

  private

  def set_vitamin
    @vitamin = Vitamin.find(params[:vitamin_id])
  end

  def food_intake_params
    params.require(:food_intake).permit(:value)
  end
end
