class PageController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]
  layout 'about_us', only: [:about_us]

  def dashboard
    (@filterrific = initialize_filterrific(
        Paper,
        params[:filterrific]
    )) || return
    @papers = @filterrific.find.page(params[:page]).includes(:user, :institute)
    @featured_paper = Paper.find(12)
  end

  def about_us
  end
end
