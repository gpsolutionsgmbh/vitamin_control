# frozen_string_literal: true

class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.integer :value, null: false
      t.belongs_to :daily_vitamin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
