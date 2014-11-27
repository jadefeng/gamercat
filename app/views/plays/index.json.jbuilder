json.array!(@plays) do |play|
  json.extract! play, :id, :user_id, :score, :game_id
  json.url play_url(play, format: :json)
end
