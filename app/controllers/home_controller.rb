require 'prawn'

class HomeController < ApplicationController
  def index
    about_me = AboutMe.first
    @age = age
    @description = JSON.parse(about_me.description)[I18n.locale.to_s]
    @email = about_me.email
    @phone = about_me.phone
    @city = about_me.current_city

    experiences = Experience.all

    @stack_xp = compute_stack_xp experiences
  end

  # if makes sense in the future this file can be persisted in a storage at least for 1 month to avoid regeneration of it
  def generate_pdf_resume
    cur_locale = I18n.locale.to_s
    file_name = "resume-" + cur_locale + ".pdf"
    server_file_path = "#{Rails.root}/public/" + file_name
    
    # TODO implement a test to check this business rule of creating a pdf only if there is no file on server or the year or the month is different from the stored file
    unless File.exist?(server_file_path ) || (File.mtime(server_file_path).year != Time.now.utc.to_date.year || File.mtime(server_file_path).month != Time.now.utc.to_date.month ) 
      create_pdf server_file_path, I18n.locale
    end
    File.open(server_file_path, 'r') do |f|
      send_data f.read, filename: file_name, type: "application/pdf"
    end
  end

  private

  def compute_stack_xp experiences
    stack_xp = {}
    experiences.each do |xp|
      unless xp.stack == nil
        xp_period = date_diff(xp.start, xp.end)
        skill_set = xp.stack.split(",", -1)

        skill_set.each do |skill|
          skill_to_store = skill.split('_').collect{|c| c.capitalize}.join(' ')
          if(stack_xp.key?(skill_to_store))
            stack_xp[skill_to_store] = stack_xp[skill_to_store] + xp_period
          else
            stack_xp[skill_to_store] = xp_period
          end
        end
        stack_xp = stack_xp.sort_by {|_key, value| value}.reverse.to_h
      end
    end
    stack_xp
  end
  
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

  def create_pdf path, locale
    # getting_data
    academic_formations = AcademicFormation.all
    experiences = Experience.all.reverse
    xp_stack = compute_stack_xp experiences
    about_me = AboutMe.first
    now = Time.now.utc.to_date
    profile_img = Rails.root.join("app", "assets", "images", "profile.jpeg").to_s
    line_spacing_header = 5
    line_spacing = 2
    line_spacing_big = 8

    # starting pdf gen
    prawn = Prawn::Document.new
    prawn.text I18n.t(:generated_on, year: now.year.to_s, month: ("%02d" % now.month).to_s, day: ("%02d" % now.day).to_s), align: :right, size: 8
    prawn.image profile_img, scale: 0.07
    prawn.text "JOÃO LUCAS VELOSO GOUVEIA", align: :center, size: 20, style: :bold
    prawn.text "\n"
    prawn.icon '<icon size="11" color="000000">fas-birthday-cake</icon>' + "  " + I18n.t(:date, day: "10", month: "02", year: "1989") + " (" + I18n.t(:years_old, age: age) + ")", size: 11, inline_format: true, leading: line_spacing_header
    prawn.icon '<icon size="11" color="000000">fas-ring</icon>' + "  " + I18n.t(:married), size: 11, inline_format: true, leading: line_spacing_header
    prawn.icon '<icon size="11" color="000000">fas-home</icon>' + "  " + about_me.address + " - " + about_me.current_city, size: 11, inline_format: true, leading: line_spacing_header
    prawn.icon '<icon size="11" color="000000">fas-phone</icon>' + "  " + about_me.phone, size: 11, inline_format: true, leading: line_spacing_header
    prawn.icon '<icon size="11" color="000000">fas-envelope</icon>' + '  <link href="mailto:'+ about_me.email + '">' + about_me.email   + '</link>', size: 11, inline_format: true, leading: line_spacing_header
    prawn.icon '<icon size="11" color="000000">fab-github</icon>' + '  <link href="https://www.github.com/joaogouveia89' '">' + "joaogouveia89"  + '</link>', size: 11, inline_format: true, leading: line_spacing_header
    prawn.icon '<icon size="11" color="000000">fab-skype</icon> joaoautomacaomg' , size: 11, inline_format: true, leading: line_spacing_header
    prawn.text "\n\n"
    prawn.text "Software Engineer", align: :center, size: 26, style: :bold, leading: line_spacing_header
    prawn.text "\n"
    prawn.text JSON.parse(about_me.description)[locale.to_s], size: 14, leading: line_spacing
    prawn.text "\n\n"
    prawn.text I18n.t(:academic_formation), align: :center, size: 20, style: :bold
    prawn.text "\n"
    academic_formations.each do |af|
      prawn.text af.institution, size: 14, style: :bold, leading: line_spacing
      prawn.text af.title, size: 14, leading: line_spacing
      prawn.text I18n.t(:date_period, years: af.start.year, months: ("%02d" % af.start.month).to_s, yeare: af.end.year, monthe: ("%02d" % af.end.month).to_s), size: 14, leading: line_spacing_big
    end
    prawn.start_new_page
    prawn.text I18n.t(:speak_languages), align: :center, size: 20, style: :bold
    prawn.text "\n"
    prawn.text I18n.t(:portuguese), size: 14, style: :bold, leading: line_spacing
    prawn.text I18n.t(:first_language), size: 14, leading: line_spacing_big
    prawn.text I18n.t(:english), size: 14, style: :bold, leading: line_spacing
    prawn.text I18n.t(:fluency_all), size: 14, leading: line_spacing_big
    prawn.text "\n"
    prawn.text I18n.t(:skills_summary), align: :center, size: 20, style: :bold 
    prawn.text "\n"
    xp_stack.each do |xp, time|
      prawn.text (xp + " - " + helpers.period_to_s(time)), size: 14, leading: line_spacing
    end
    prawn.text "\n"
    prawn.text I18n.t(:experience), align: :center, size: 20, style: :bold 
    prawn.text "\n"
    experiences.each do |exp|
      prawn.text (exp.role[0] == '{' ? JSON.parse(exp.role)[locale.to_s] : exp.role) + " - " + (exp.company[0] == '{' ? JSON.parse(exp.company)[locale.to_s] : exp.company), size: 14, style: :bold, leading: line_spacing
      prawn.text (exp.end == nil ? I18n.t(:date_period_current, years: exp.start.year, months: ("%02d" % exp.start.month).to_s) : I18n.t(:date_period, years: exp.start.year, months: ("%02d" % exp.start.month).to_s, yeare: exp.end.year, monthe: ("%02d" % exp.end.month).to_s)), size: 14, leading: line_spacing_big
      prawn.text JSON.parse(exp.description)[locale.to_s], size: 12, leading: line_spacing
      prawn.text "\n"
    end
    prawn.render_file(path)
  end
end
