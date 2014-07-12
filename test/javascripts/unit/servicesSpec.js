'use strict';

describe('Service', function() {


	beforeEach(function() {
	    this.addMatchers({
	        toEqualData: function(expected) {
	            return angular.equals(this.actual, expected);
	        }
	    });
	});

	beforeEach(module('libraryApp'));

	it('check the existence of BookService', inject(function(BookService) {
		expect(BookService).toBeDefined();
	}));

	it('should check the existence of UserService', inject(function(User) {
		expect(User).toBeDefined();
	}));

	describe('BookShareService', function() {
		it('should check the existence of BookShareService ', inject(function(BookShareService) {
			expect(BookShareService).toBeDefined();
			expect(BookShareService.books).toEqualData([]);
			expect(BookShareService.book).toBe(undefined);
		}));

		it('should add a book', inject(function(BookShareService) {
		  	var book = { title: 'JavaScript book' };

			BookShareService.books.push(book);

			expect(BookShareService.books[0]).toEqualData(book);
		}));

	});

	describe('LoadingService', function() {
		it('should check the existence of LoadingService', inject(function(LoadingService) {
			expect(LoadingService).toBeDefined();
		}));

		it('should change loadingView value', inject(function($rootScope, LoadingService) {
			var scope = $rootScope.$new();

			expect(scope.loadingView).toBe(undefined);

			LoadingService.setLoading(true);
			expect(scope.loadingView).toBe(true);

			LoadingService.setLoading(false);
			expect(scope.loadingView).toBe(false);
		}));
	});
});