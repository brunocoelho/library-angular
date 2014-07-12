describe('Bookle', function() {
	// beforeEach(function() {
	// });


	// it('should login', function() {
		(function() {

			browser.get('http://localhost:3000');

			var email = element(by.id('user_email')),
				password = element(by.id('user_password')),
				signinButton = element(by.id('signin'));

			email.sendKeys('bruno@gmail.com');
			password.sendKeys('12345678');

			signinButton.click();
		}());
	// });

	it('should have a title', function() {
	  	expect(browser.getTitle()).toEqual("Library");
	});

	it('should have 40 books listed', function() {
		var books = element.all(by.repeater('book in books'));

		expect(books.count()).toBe(40);
	});

	it('should search for other books', function() {
		var books,
			inputQuery = element(by.model('query')),
			searchButton = element(by.css('form button'));

		inputQuery.sendKeys('ruby');
		searchButton.click();

		books = element.all(by.repeater('book in books'));

		expect(books.count()).toBe(40);
	});

	it('should have page 1 pagination marked as disabled', function() {
		var paginationPage = element(by.css('.pagination li.disabled'));

		expect(paginationPage.getText()).toBe('1');
	});

	it('should go to detail book page', function() {
		var book = element.all(by.css('.product-card > div')).first(),
			principalBook;

		book.click();

		principalBook = element.all(by.css('.principal-book'));
		expect(principalBook.count()).toBe(1);
	});

	it('should change similar book', function() {
		var similarBookImageSrc = element(by.css('.similar-book div img')).getAttribute('src'),
			nextBookArrow = element(by.css('.next-book'));

		nextBookArrow.click();

		var newSimilarImageSrc = element(by.css('.similar-book div img')).getAttribute('src');

		expect(similarBookImageSrc).not.toBe(newSimilarImageSrc);
	});


  //####################

  // var firstNumber = element(by.model('first'));
  // var secondNumber = element(by.model('second'));
  // var goButton = element(by.id('gobutton'));
  // var latestResult = element(by.binding('latest'));

  // beforeEach(function() {
  //   browser.get('http://juliemr.github.io/protractor-demo/');
  // });

  // it('should have a title', function() {
  //   expect(browser.getTitle()).toEqual('Super Calculator');
  // });

  // it('should add one and two', function() {
  //   firstNumber.sendKeys(1);
  //   secondNumber.sendKeys(2);

  //   goButton.click();

  //   expect(latestResult.getText()).toEqual('3');
  // });

  // it('should add four and six', function() {
  //   // Fill this in.
  //   expect(latestResult.getText()).toEqual('10');
  // });
});