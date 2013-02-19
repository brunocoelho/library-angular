json.array!(@authors) do |json, author|
  json.id      author.id
  json.name    author.name
  json.book_id author.book_id
end
