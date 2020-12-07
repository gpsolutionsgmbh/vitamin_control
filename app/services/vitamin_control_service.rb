# frozen_string_literal: true

class VitaminControlService
  MAX_TOTAL = 10

  def initialize(current_user, vitamin, params)
    @vitamin = vitamin
    @params = params
    @current_user = current_user
    @daily_vitamin = @current_user.daily_vitamins.where(day: Date.today, vitamin_id: @vitamin).first_or_create
  end

  def perform_activity
    @activity = @daily_vitamin.activities.new(@params)
    add_activity if @activity.save
    @activity
  end

  def perform_food_intake
    @food_intake = @daily_vitamin.food_intakes.new(@params)
    add_food_intakes if @food_intake.save
    @food_intake
  end

  private

  def add_activity
    @daily_vitamin.update(total: @daily_vitamin.total - @activity.value)
  end

  def add_food_intakes
    new_total = @daily_vitamin.total + @food_intake.value
    total = new_total > MAX_TOTAL ? MAX_TOTAL : new_total
    @daily_vitamin.update(total: total)
  end
end