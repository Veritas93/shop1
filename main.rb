# подключаем классы товара
require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'

# Передаем имя объекта, цену и количество на складе в hash при создании экземпляра класса
current_path = File.dirname(__FILE__)
book = Book.from_file(current_path + "/data/books/01.txt")
film = Film.from_file(current_path + "/data/films/01.txt")

puts film
puts book

# Пытаемся вызвать метод  from_file у класса product и ловим ошибку
  begin 
    Product.from_file(current_path + "/data/films/01.txt")
  rescue NotImplementedError
    puts "Метод класса product.from_file не реализован"
  end
