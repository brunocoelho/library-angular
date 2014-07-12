json.array!(@books['items']) do |json, book|
  json.authors       book['volumeInfo']['authors']
  json.averageRating book['volumeInfo']['averageRating']
  json.description   book['volumeInfo']['description']
  json.id            book['id']
  json.image_url     book['volumeInfo']['imageLinks']['thumbnail']
  json.infoLink      book['volumeInfo']['infoLink']
  json.pages         book['volumeInfo']['pageCount']
  json.publishedDate book['volumeInfo']['publishedDate']
  json.publisher     book['volumeInfo']['pageCount']
  json.ratingsCount  book['volumeInfo']['ratingsCount']
  json.selfLink      book['selfLink']
  json.saleability   book['saleInfo']['saleability']
  json.title         book['volumeInfo']['title']

  if book['saleInfo']['saleability'] == "FOR_SALE"
    json.listPrice     book['saleInfo']['listPrice']['amount']
    json.retailPrice   book['saleInfo']['retailPrice']['amount']
  end
end
