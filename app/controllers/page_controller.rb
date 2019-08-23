class PageController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]
  layout 'about_us', only: [:about_us]

  def dashboard
  end

  def about_us
  end
end
