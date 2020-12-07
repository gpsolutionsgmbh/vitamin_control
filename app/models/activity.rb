# frozen_string_literal: true

class Activity < ApplicationRecord
  belongs_to :daily_vitamin

  validates :value, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 3, only_integer: true }
end
