# frozen_string_literal: true

class CreateVitamins < ActiveRecord::Migration[6.0]
  def change
    create_table :vitamins do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
