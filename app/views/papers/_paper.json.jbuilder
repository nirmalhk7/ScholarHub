json.extract! paper, :id, :user_id, :journal_link, :institute_id, :fields, :abstract, :created_at, :updated_at
json.url paper_url(paper, format: :json)
