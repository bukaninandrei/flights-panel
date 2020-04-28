# frozen_string_literal: true

class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.string :title
      t.string :state

      t.timestamps
    end
  end
end
