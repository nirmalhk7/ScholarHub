class Conversation < ApplicationRecord
  has_many :messages

  scope :involved, ->(query) {
    where(inviter_id: query).or(where(invitee_id: query))
  }

  self.per_page = 5

  def self.last_conversations(user_id)
    conversations = involved(user_id)
    conversations = conversations.select {|conversation| conversation.messages.present? }
    conversations.sort! { |conversation| conversation.messages.last.created_at }.last(3)
  end

  def partner(user_id)
    return User.find(invitee_id) if inviter_id == user_id
    User.find(inviter_id)
  end

  def self.seed(n_conversation)
    Message.destroy_all
    Conversation.destroy_all
    users = User.ids - [1]
    n_conversation.times do
      if rand(2) == 1
        inviter_id = 1
        invitee_id = users.sample
      else
        invitee_id = 1
        inviter_id = users.sample
      end
      convo = create!(invitee_id: invitee_id, inviter_id: inviter_id)

      if rand(2) == 1
        convo.messages.create!(sender_id: inviter_id, reciever_id: invitee_id, content: 'I found your problem statement interestings. Want to discuss this over email?')
      end
    end
  end
end
