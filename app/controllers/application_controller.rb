require 'application_responder'

class ApplicationController < ActionController::Base
  before_action :basic_auth

  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception

  def admin
    Admin.first
  end

  private

  def basic_auth
    # TODO productionで.envが読めてないみたい
    return if Rails.env.development? || Rails.env.production?
    authenticate_or_request_with_http_basic do |user, pass|
      user == ENV['BASIC_AUTH_USER'] && pass == ENV['BASIC_AUTH_PASS']
    end
  end
end
