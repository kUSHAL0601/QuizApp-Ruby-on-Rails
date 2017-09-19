json.extract! state, :id, :userid, :genre, :subgenre, :qsnid, :score, :created_at, :updated_at
json.url state_url(state, format: :json)
