# frozen_string_literal: true

class CreateFlightEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :flight_events do |t|
      t.belongs_to :flight
      t.string :type

      t.timestamps
    end
  end
end
