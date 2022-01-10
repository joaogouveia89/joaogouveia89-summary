class HomeController < ApplicationController
  def index
    about_me = AboutMe.first
    @age = age
    @description = JSON.parse(about_me.description)[I18n.locale.to_s]
    @email = about_me.email
    @phone = about_me.phone
    @city = about_me.current_city
    @stack_xp = {}

    experiences = Experience.all

    experiences.each do |xp|
      unless xp.stack == nil
        xp_period = date_diff(xp.start, xp.end)

        skill_set = xp.stack.split(",", -1)

        skill_set.each do |skill|
          skill_to_store = skill.split('_').collect{|c| c.capitalize}.join(' ')
          if(@stack_xp.key?(skill_to_store))
            @stack_xp[skill_to_store] = @stack_xp[skill_to_store] + xp_period
          else
            @stack_xp[skill_to_store] = xp_period
          end
        end

        @stack_xp = @stack_xp.sort_by {|_key, value| value}.reverse.to_h
      end
    end
  end

  private
  
  def age
    birthdate = Date.new(1989,2,10)
    now = Time.now.utc.to_date
    return  now.year - birthdate.year - ((now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)) ? 0 : 1)
  end

  def date_diff(dstart, dend)
    if dend == nil
      dend = Time.now.utc.to_date
    end
    
    return (dend.year * 12 + dend.month) - (dstart.year * 12 + dstart.month)
  end
end
