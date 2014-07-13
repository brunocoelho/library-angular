'use strict';

describe('Controllers', function() {

    beforeEach(function() {
        this.addMatchers({
            toEqualData: function(expected) {
                return angular.equals(this.actual, expected);
            }
        });
    });

    describe('DetailBookCtrl', function() {
        var book, ctrl, scope, $httpBackend;

        book = {
                    authors: ['John', 'Galt'],
                    averageRating: '3.0',
                    description: 'description',
                    id: '856'
                };

        beforeEach(module('libraryApp'));

        beforeEach(inject(function(_$httpBackend_, $rootScope, $controller, $routeParams) {
            $httpBackend = _$httpBackend_;
            $httpBackend.expectGET('books/856').
                respond(book);

            $httpBackend.expectGET('books?q=science').
                respond([{ id:1 }, { id:2 }]);

            $routeParams.id = '856'

            scope = $rootScope.$new();
            ctrl = $controller('DetailBookCtrl', { $scope: scope });
        }));

        it('should have "book" model with 1 book fetched from xhr', function() {
            expect(scope.book).toBe(undefined);

            $httpBackend.flush();

            expect(scope.book.id).toBe('856');
        });

        it('should get book from BookService', inject(function(BookShareService, $rootScope, $controller) {
            var book = [{ title: 'JavaScript The definitive guide' }];

            BookShareService.book = book;

            var scope = $rootScope.$new(),
                ctrl = $controller('DetailBookCtrl', { $scope: scope, BookShareService: BookShareService });

            expect(scope.book).toBe(book);
        }));
    });

    describe('BookCtrl', function() {
        var books, ctrl, scope, $httpBackend;

        books = [
                    {
                        authors: ['John', 'Galt'],
                        averageRating: '3.0',
                        description: 'description',
                        id: '4687'
                    }
                ];

        beforeEach(module('libraryApp'));

        beforeEach(inject(function(_$httpBackend_, $rootScope, $controller) {
            $httpBackend = _$httpBackend_;
            $httpBackend.expectGET('books?q=science&startIndex=0').
                respond(books);

            scope = $rootScope.$new();
            ctrl = $controller('BookCtrl', { $scope: scope });
        }));

      	it('should have "books" model with 1 book fetched from xhr', function() {
            expect(scope.books).toEqualData(undefined);

            $httpBackend.flush();

            expect(scope.books).toEqualData(books);
        });
    });

    describe('ApplicationCtrl', function() {
        var books, ctrl, scope, $httpBackend;

        beforeEach(module('libraryApp'));

        books = [{ id: 2 }];

        beforeEach(inject(function(_$httpBackend_, $rootScope, $controller) {
            $httpBackend = _$httpBackend_;
            $httpBackend.expectGET('books?q=science').
                respond(books);

            scope = $rootScope.$new();
            ctrl = $controller('ApplicationCtrl', { $scope: scope });

            spyOn(scope, '$broadcast');
        }));

        it('should have books fetched from xhr', function() {
            scope.searchBooks();

            $httpBackend.flush();

            expect(scope.$broadcast).toHaveBeenCalled();
        });
    });
});
