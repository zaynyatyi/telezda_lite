class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def clear_stalkers
    users = User.all
    for user in users do
      user.is_stalker = false
      user.save()
    end
  end
end
