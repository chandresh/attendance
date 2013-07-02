class WelcomeController < ApplicationController
  def index

    ## check for admin here  - remove comments:
    # if current_user.admin?
    @attendances = Attendance.order
    # else
    # @attendances = current_user.attendance

  end
end
