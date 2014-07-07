json.authors       @book['volumeInfo']['authors']
json.averageRating @book['volumeInfo']['averageRating']
json.id            @book['id']
json.image_url     @book['volumeInfo']['imageLinks']['medium']
json.isbn          @book['volumeInfo']['industryIdentifiers'][0]['identifier']
json.pages         @book['volumeInfo']['pageCount']
json.publishedDate @book['volumeInfo']['publishedDate']
json.publisher     @book['volumeInfo']['publisher']
json.ratingsCount  @book['volumeInfo']['ratingsCount']
json.saleability   @book['saleInfo']['saleability']
json.title         @book['volumeInfo']['title']

if @book['saleInfo']['saleability'] != "NOT_FOR_SALE"
	json.listPrice     @book['saleInfo']['listPrice']['amount']
	json.retailPrice   @book['saleInfo']['retailPrice']['amount']
end