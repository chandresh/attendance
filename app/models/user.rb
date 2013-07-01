class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password

  has_many :attendances

  def hours_for_day(date=Date.today)
    8
  end

  def login
    now = DateTime.now
    prev_day = now.prev_day.end_of_day
    next_day = now.next_day.beginning_of_day
    if attendances.where(login: (prev_day..next_day)).count.zero?
      attendances.create(login: DateTime.now)
    end
  end

  def logout_for_day
    attendance = attendances.last
    attendance.logout = DateTime.now
    attendance.save
  end

end
