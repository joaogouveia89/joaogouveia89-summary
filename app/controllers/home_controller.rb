class HomeController < ApplicationController
  def index
    about_me = AboutMe.first
    @age = age
    @description = JSON.parse(about_me.description)[I18n.locale.to_s]
    @email = about_me.email
    @phone = about_me.phone
    @city = about_me.current_city
  end

  private
  
  def age
    birthdate = Date.new(1989,2,10)
    now = Time.now.utc.to_date
    return  now.year - birthdate.year - ((now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)) ? 0 : 1)
  end
end
