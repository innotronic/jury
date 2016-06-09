json.array!( @contestants ) do |contestant|
  json.extract! contestant, :id, :name, :number, :category_id
  json.url contestant_url( contestant, format: :json )
end
