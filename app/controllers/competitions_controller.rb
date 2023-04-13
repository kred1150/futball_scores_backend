class CompetitionsController < ApplicationController
  def index
    competitions = Competition.all
    tier_one_competitions = competitions.select { |comp| comp["plan"] == "TIER_ONE" }
    render json: tier_one_competitions.as_json
  end
end
