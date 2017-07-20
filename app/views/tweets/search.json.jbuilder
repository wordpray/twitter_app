json.array! @tweets_keywords do |tweet|
  json.id tweet.id
  json.content tweet.content
end
