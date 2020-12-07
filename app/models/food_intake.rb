# frozen_string_literal: true

class FoodIntake < ApplicationRecord
  belongs_to :daily_vitamin

  validates :value, presence: true, numericality: { greater_than_or_equal_to: 4, less_than_or_equal_to: 10, only_integer: true }
end
