json.array!(@scores) do |score|
  json.extract! score, :id, :contestant_id, :judge_id, :value
  json.url score_url(score, format: :json)
end
