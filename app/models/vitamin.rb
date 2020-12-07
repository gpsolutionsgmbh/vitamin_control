# frozen_string_literal: true

class Vitamin < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
