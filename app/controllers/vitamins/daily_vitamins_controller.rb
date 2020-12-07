# frozen_string_literal: true

module Vitamins
  class DailyVitaminsController < ApplicationController
    before_action :find_vitamin

    def index
      @daily_vitamins = current_user.daily_vitamins.where(vitamin: @vitamin)
    end

    def show
      @daily_vitamin = current_user.daily_vitamins.find(params[:id])
    end

    private

    def find_vitamin
      @vitamin = Vitamin.find(params[:vitamin_id])
    end
  end
end
