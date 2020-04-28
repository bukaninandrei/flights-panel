# frozen_string_literal: true

module FlightsHelper
  include Pagy::Frontend

  def han(object, attribute)
    object.human_attribute_name(attribute)
  end
end
