class Attendance < ActiveRecord::Base
  attr_accessible :login, :logout, :user_id

  belongs_to :user

  def start_time
    login
  end

  def title
    "#{user.email.split('@')[0]} : #{user.hours_for_day} hrs"
  end

end
