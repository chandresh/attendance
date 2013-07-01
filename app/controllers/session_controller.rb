class SessionController < ApplicationController
  def new

  end

  def create
    session_params = params[:session]

    if (user = User.find_by_email(session_params[:email])) && user.authenticate(session_params[:password])
      session['user_id'] = user.id
      user.login
      redirect_to root_url
    else
      redirect_to login_url
    end
  end

  def destroy
    session['user_id'] = nil
    redirect_to login_url
  end

  def logout_for_day
    current_user.logout_for_day
    destroy
  end

end
