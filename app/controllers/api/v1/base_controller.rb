class Api::V1::BaseController < ApplicationController

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :deny_access

  # disable the CSRF token
  protect_from_forgery with: :null_session

  # disable cookies (no set-cookies header in response)
  before_action :destroy_session

  # disable the CSRF token
  skip_before_action :verify_authenticity_token

  attr_accessor :current_user

  def destroy_session
    request.session_options[:skip] = true
  end

  def api_error(opts = {})
    api_render({:message => '失败'|| opts[:message], :status => 422, :success => false}.merge(opts))
  end

  def unauthenticated!
    api_render({:message=>'未授权',status: 401,:success=>false})
  end

  def api_render(opts = {})
    render :json=>opts, status: opts[:status]
  end

  def deny_access
    api_error(status: 403)
  end

  def authenticate_user!
    token, options = ActionController::HttpAuthentication::Token.token_and_options(request)
  
    user_email = options.blank?? nil : options[:email]
    user = user_email && User.find_by(email: user_email)
  
    if user && ActiveSupport::SecurityUtils.secure_compare(user.authentication_token, token)
      self.current_user = user
    else
      return unauthenticated!
    end
  end
end
