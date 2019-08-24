class Conversation < ApplicationRecord
  belongs_to :reciever_id
  belongs_to :sender_id
end
