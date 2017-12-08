json.extract! bulletin, :id, :title, :content, :created_at, :updated_at
json.url bulletin_url(bulletin, format: :json)
