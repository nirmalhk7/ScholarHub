class PageController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]
  def dashboard
  end

  def about_us
    self.class.layout 'about_us'
  end
end
