# frozen_string_literal: true


class VitaminsController < ApplicationController
  def index
    @vitamins = Vitamin.all
  end

  def show
    @vitamin = Vitamin.find(params[:id])
    @daily_vitamins = current_user.daily_vitamins.where(vitamin_id: @vitamin)
  end
end
