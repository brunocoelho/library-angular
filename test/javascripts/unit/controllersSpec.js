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

            $httpBackend.expectGET('books').
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
            $httpBackend.expectGET('books?').
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
        var ctrl, scope, user, $httpBackend;

        var user = { name: 'John Galt', email: 'john@gmail.com' };

        beforeEach(module('libraryApp'));

        beforeEach(inject(function(_$httpBackend_, $rootScope, $controller) {
            $httpBackend = _$httpBackend_;
            $httpBackend.expectGET('user').
                respond(user);

            scope = $rootScope.$new();
            ctrl = $controller('ApplicationCtrl', { $scope: scope });
        }));

        it('should have user fetched from xhr', function() {
            expect(scope.currentUser).toBe(undefined);

            $httpBackend.flush();

            expect(scope.currentUser.email).toBe(user.email);
        });
    });
});
