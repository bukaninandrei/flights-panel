# frozen_string_literal: true

Configus.build Rails.env do
  env :production do
    flight_time 10.seconds
  end

  env :development, parent: :production

  env :test do
    flight_time 0
  end
end
