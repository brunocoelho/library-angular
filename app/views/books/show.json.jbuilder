if @book['error']['code'] == 404
	json.error 'Book not found'
	json.code '404'
else
	json.authors       @book['volumeInfo']['authors']
	json.averageRating @book['volumeInfo']['averageRating']
	json.description   @book['volumeInfo']['description']
	json.id            @book['id']
	json.image_url     @book['volumeInfo']['imageLinks']['medium']
	json.infoLink      @book['volumeInfo']['infoLink']
	json.isbn          @book['volumeInfo']['industryIdentifiers'][0]['identifier']
	json.pages         @book['volumeInfo']['pageCount']
	json.publishedDate @book['volumeInfo']['publishedDate']
	json.publisher     @book['volumeInfo']['publisher']
	json.ratingsCount  @book['volumeInfo']['ratingsCount']
	json.saleability   @book['saleInfo']['saleability']
	json.title         @book['volumeInfo']['title']

	if @book['saleInfo']['saleability'] == "FOR_SALE"
		json.listPrice     @book['saleInfo']['listPrice']['amount']
		json.retailPrice   @book['saleInfo']['retailPrice']['amount']
	end
end