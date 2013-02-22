#LibraryApp

Este app foi criado com a intenção de usar AngularJs com Rails.

http://library-angular.herokuapp.com/

Login como usuário:

* Login: bruno@gmail.com
* Senha: 12345678

Login como funcionário:

* Login: carlos@gmail.com
* Senha: 12345678

## Specs

* Ruby: 1.9.3-p362
* Rails: 3.2.11
* Banco em desenvolvimento: MySql
* Banco em produção: PostgreSQL

## Setup

Se você usa rvm crie sua própria gemset e rode o bundle:

`rvm --create --rvmrc use [RUBY_VERSION]@[GEMSET_NAME]`

`bundle install`

## Testes

Para rodar os testes siga os comandos:

`rake db:test:clone`

`rspec spec/models`

`testacular start spec/javascripts/testacular.conf.js`
