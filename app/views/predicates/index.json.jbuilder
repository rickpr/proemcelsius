json.array!(@predicates) do |predicate|
  json.extract! predicate, :id, :name, :prolog
  json.url predicate_url(predicate, format: :json)
end
