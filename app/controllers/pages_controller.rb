class PagesController < ApplicationController

  skip_authorization_check

  def home
    @current_nav_identifier = :home
  end

  def hours_manag
    @studies = Study.all
  end

end
