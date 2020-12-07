# frozen_string_literal: true

class ActivitiesController < ApplicationController
  before_action :set_vitamin
  respond_to :html

  def new
    @activity = Activity.new
  end

  def create
    @vitamin_control = VitaminControlService.new(current_user, @vitamin, activity_params)
    @activity = @vitamin_control.perform_activity
    if @activity.persisted?
      redirect_to vitamin_daily_vitamin_path(@vitamin, @activity.daily_vitamin)
    else
      render :new
    end
  end

  private

  def set_vitamin
    @vitamin = Vitamin.find(params[:vitamin_id])
  end

  def activity_params
    params.require(:activity).permit(:value)
  end
end
