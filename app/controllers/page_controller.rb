class PageController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]
  layout 'about_us', only: [:about_us]

  def dashboard
    @featured_paper = Paper.find(12)
    @last_conversations = Conversation.last_conversations(current_user.id)
  end

  def about_us
  end
end
