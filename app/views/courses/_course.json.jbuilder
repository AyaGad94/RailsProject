json.extract! course, :id, :user_id, :title, :created_at, :updated_at
json.url course_url(course, format: :json)
