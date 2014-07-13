json.array!(@books['items']) do |json, book|
  json.id          book['id']
  json.selfLink    book['selfLink']

  if book['volumeInfo']
    json.authors       book['volumeInfo']['authors']
    json.averageRating book['volumeInfo']['averageRating']
    json.description   book['volumeInfo']['description']
    json.infoLink      book['volumeInfo']['infoLink']
    json.pages         book['volumeInfo']['pageCount']
    json.publishedDate book['volumeInfo']['publishedDate']
    json.publisher     book['volumeInfo']['pageCount']
    json.ratingsCount  book['volumeInfo']['ratingsCount']
    json.title         book['volumeInfo']['title']

    if book['volumeInfo']['imageLinks']
      if book['volumeInfo']['imageLinks']['thumbnail']
        json.image_url   book['volumeInfo']['imageLinks']['thumbnail']
      end
    end
  end

  if book['saleInfo']
    json.saleability book['saleInfo']['saleability']

    if book['saleInfo']['saleability'] == "FOR_SALE"
      json.listPrice   book['saleInfo']['listPrice']['amount']
      json.retailPrice book['saleInfo']['retailPrice']['amount']
    end
  end

end
