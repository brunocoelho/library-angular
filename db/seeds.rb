[User, Book, Author].each { |model| model.destroy_all }

user_1 = User.create(name: 'Bruno', email: 'bruno@gmail.com', password: '12345678')
user_2 = User.create(name: 'Joao', email: 'joao@gmail.com', password: '12345678')
user_3 = User.create(name: 'Maria', email: 'maria@gmail.com', password: '12345678')
user_4 = User.create(name: 'Carolina', email: 'carolina@gmail.com', password: '12345678')


book_1 = Book.create(isbn: '1934356549',
                     title: 'Agile Web Development with Rails',
                     edition: 'Fourth Edition',
                     pages: 488,
                     image_url: 'assets/books/book_1.jpg')

book_2 = Book.create(isbn: '0321832051',
                     title: 'Ruby on Rails Tutorial: Learn Web Development with Rails',
                     edition: 'Second Edition',
                     pages: 640,
                     image_url: 'assets/books/book_2.jpg')

book_3 = Book.create(isbn: '0321601661',
                     title: 'The Rails 3 Way',
                     edition: 'Second Edition',
                     pages: 768,
                     image_url: 'assets/books/book_3.jpg')

book_4 = Book.create(isbn: '1934356085',
                     title: 'Programming Ruby 1.9: The Pragmatic Programmers` Guide',
                     edition: 'Third Edition',
                     pages: 864,
                     image_url: 'assets/books/book_4.jpg')

book_5 = Book.create(isbn: '0596805527',
                     title: 'JavaScript: The Definitive Guide',
                     edition: 'Sixth Edition',
                     pages: 1100,
                     image_url: 'assets/books/book_5.jpg')

book_6 = Book.create(isbn: '0596517742',
                     title: 'JavaScript: The Good Parts',
                     edition: 'First Edition',
                     pages: 176,
                     image_url: 'assets/books/book_6.jpg')

book_7 = Book.create(isbn: '0596806752',
                     title: 'JavaScript Patterns',
                     edition: 'First Edition',
                     pages: 236,
                     image_url: 'assets/books/book_7.jpg')

book_8 = Book.create(isbn: '1593272820',
                     title: 'Eloquent JavaScript: A Modern Introduction to Programming',
                     edition: 'First Edition',
                     pages: 224,
                     image_url: 'assets/books/book_8.jpg')

book_9 = Book.create(isbn: '1449331815',
                     title: 'Learning JavaScript Design Patterns',
                     edition: 'First Edition',
                     pages:254,
                     image_url: 'assets/books/book_9.jpg')

book_10 = Book.create(isbn: '144930351X',
                      title: 'JavaScript Web Applications',
                      edition: 'First Edition',
                      pages: 282,
                      image_url: 'assets/books/book_10.jpg')

book_11 = Book.create(isbn: '1449321054',
                      title: 'The Little Book on CoffeeScript',
                      edition: 'First Edition',
                      pages: 64,
                      image_url: 'assets/books/book_11.jpg')

book_12 = Book.create(isbn: '1449398588',
                      title: 'Node: Up and Running: Scalable Server-Side Code with JavaScript',
                      edition: 'First Edition',
                      pages: 204,
                      image_url: 'assets/books/book_12.jpg')

book_13 = Book.create(isbn: '1449323073',
                      title: 'Learning Node',
                      edition: 'First Edition',
                      pages: 396,
                      image_url: 'assets/books/book_13.jpg')

Author.create([
  { name: 'Sam Ruby', book_id: book_1.id },
  { name: 'David Heinemeier Hansson', book_id: book_1.id },

  { name: 'Michael Hartl ', book_id: book_2.id },

  { name: 'Obie Fernandez', book_id: book_3.id },

  { name: 'Dave Thomas', book_id: book_4.id },
  { name: 'Chad Fowler', book_id: book_4.id },

  { name: 'David Flanagan', book_id: book_5.id },

  { name: 'Douglas Crockford', book_id: book_6.id },

  { name: 'Stoyan Stefanov', book_id: book_7.id },

  { name: 'Marijn Haverbeke', book_id: book_8.id },

  { name: 'Addy Osmani', book_id: book_9.id },

  { name: 'Alex MacCaw', book_id: book_10.id },

  { name: 'Alex MacCaw', book_id: book_11.id },

  { name: 'Tom Hughes-Croucher', book_id: book_12.id },
  { name: 'Mike Wilson', book_id: book_12.id },

  { name: 'Shelley Powers', book_id: book_13.id }
])
