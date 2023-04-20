class CompetitionsController < ApplicationController
  def index
    pp Rails.application.credentials.futball_api_key
    competitions = Competition.all
    @tier_one_competitions = competitions.select { |comp| comp["plan"] == "TIER_ONE" }
    render json: @tier_one_competitions.as_json
  end

  def test
    response = HTTP.auth("#{Rails.application.credentials.futball_api_key}").get("http://api.football-data.org/v4/competitions/PL/standings")
    pp response
    standings = JSON.parse(response.body)
    render json: standings.as_json
  end
end
