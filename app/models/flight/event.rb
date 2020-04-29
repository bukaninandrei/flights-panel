# frozen_string_literal: true

class Flight::Event < ApplicationRecord
  def self.inheritance_column
    nil
  end
end
