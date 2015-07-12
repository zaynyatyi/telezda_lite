class WelcomeController < ApplicationController
  include SessionsHelper

  def index
    if logged_in?
      if current_user.mothercity != nil
        redirect_to current_user.mothercity
      else
        redirect_to current_user
      end
    end
  end
end
