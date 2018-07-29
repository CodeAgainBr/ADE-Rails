class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  Time.zone = "America/Sao_Paulo"
end
