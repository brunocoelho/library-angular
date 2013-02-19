json.array!(@books) do |json, book|
  json.id           book.id
  json.title        book.title
  json.isbn         book.isbn
  json.edition      book.edition
  json.pages        book.pages
  json.lending_date book.lending_date
  json.user_id      book.user_id
end
