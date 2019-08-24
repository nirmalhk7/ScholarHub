json.extract! conversation, :id, :reciever_id_id, :sender_id_id, :created_at, :updated_at
json.url conversation_url(conversation, format: :json)
