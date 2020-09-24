class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    config.api_only = true
end
