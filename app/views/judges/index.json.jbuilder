json.array!(@judges) do |judge|
  json.extract! judge, :id, :name
  json.url judge_url(judge, format: :json)
end
