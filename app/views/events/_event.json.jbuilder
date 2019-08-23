json.extract! event, :id, :institute_id, :title, :description, :fields, :certification, :price, :start_date, :end_date, :created_at, :updated_at
json.url event_url(event, format: :json)
