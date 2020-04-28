# frozen_string_literal: true

Flight.delete_all

%w[Jet Boeing An Tu].each do |flight_model|
  10.times do
    title = "#{flight_model}-#{rand(100)}"
    Flight.create!(title: title)
  end
end
