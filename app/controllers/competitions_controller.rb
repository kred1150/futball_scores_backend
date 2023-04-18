class CompetitionsController < ApplicationController
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods
  @api_key = Rails.application.credentials.futball_api_key

  before_action :authenticate, except: [:index]

  def index
    competitions = Competition.all
    @tier_one_competitions = competitions.select { |comp| comp["plan"] == "TIER_ONE" }
    render json: @tier_one_competitions.as_json
  end

  def test
    response = HTTP.get("http://api.football-data.org/v4/competitions/PL/standings")
    # standings = JSON.parse(response.body)
    render json: response.as_json
  end

  def authenticate
    authenticate_or_request_with_http_token do |token, _options|
      # token_digest = ::Digest::SHA256.hexdigest(token)
      # api_auth_token_digest = ::Digest::SHA256.hexdigest(api_key)
      # ActiveSupport::SecurityUtils.secure_compare(token_digest, api_auth_token_digest)
      token == @api_key
      ActiveSupport::SecurityUtils.secure_compare(token, TOKEN)
    end
  end
end
