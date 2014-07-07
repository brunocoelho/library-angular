json.array!(@books['items']) do |json, book|
  json.authors      book['authors']
  json.id           book['id']
  json.image_url    book['volumeInfo']['imageLinks']['thumbnail']
  json.pages        book['volumeInfo']['pageCount']
  json.selfLink     book['selfLink']
  json.title        book['volumeInfo']['title']
end
