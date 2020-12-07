# frozen_string_literal: true

class CreateDailyVitamins < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_vitamins do |t|
      t.integer :total, default: 0
      t.date :day, default: -> { 'CURRENT_DATE' }
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :vitamin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
