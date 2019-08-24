class ApplicationController < ActionController::Base
  def authenticate_user!
    unless user_signed_in?
      redirect_to page_about_us_path
    end
  end

  def serialize_to_array(string)
    string.split(';').map { |x| x.strip }
  end
end
