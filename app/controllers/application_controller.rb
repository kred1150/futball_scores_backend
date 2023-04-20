class ApplicationController < ActionController::API
  def authenticate
    authenticate_or_request_with_http_token do |token, _options|
      # token_digest = ::Digest::SHA256.hexdigest(token)
      # api_auth_token_digest = ::Digest::SHA256.hexdigest(api_key)
      # ActiveSupport::SecurityUtils.secure_compare(token_digest, api_auth_token_digest)
      token == Rails.application.credentials.futball_api_key
    end
  end
end
