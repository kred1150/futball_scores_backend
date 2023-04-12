class CompetitionsController < ApplicationController
  def index
    competitions = Competition.all
    render json: competitions.as_json
  end
end
