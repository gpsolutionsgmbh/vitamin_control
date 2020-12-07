# frozen_string_literal: true

class DailyVitamin < ApplicationRecord
  belongs_to :user
  belongs_to :vitamin
  has_many :activities, dependent: :destroy
  has_many :food_intakes, dependent: :destroy

  validates :total, numericality: { less_than_or_equal_to: 10, only_integer: true }
end
