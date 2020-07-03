require 'sinatra'
require 'pry'

class ImageServer < Sinatra::Base

  get "/" do
    "Welcome to Linbot! :D"
  end

  get "/forecast" do
    possible_weathers = {
      "Clear":        '🌞',
      "Clouds":       '☁️',
      "Rain":         '🌧️',
      "Snow":         '🌨️',
      "Extreme":      '⛈️',
      "Thunderstorm": '⛈️',
      "Haze":         '☁️',
      "Mist":         '☁️'
    }

    @weather_icon = possible_weathers.key?(params["weather_main"].to_sym) ? possible_weathers[params["weather_main"].to_sym] : '🌐'
    erb :forecast
  end

  # example json route
  get "/json" do
    content_type :json

    json = File.read('ex.json')
    json
  end
end
