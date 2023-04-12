class CompetitionsController < ApplicationController
  def index
    response = HTTP.get("https://api.football-data.org/v4/competitions")
    sports = JSON.parse(response.body)["competitions"]
    render json: sports
  end
end
