# подключаем классы товара
require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/product_collection'

# Передаем имя объекта, цену и количество на складе в hash при создании экземпляра класса
current_path = File.dirname(__FILE__)
book = Book.from_file(current_path + "/data/books/01.txt")
film = Film.from_file(current_path + "/data/films/01.txt")

puts film
puts book
puts '____________________________________________________________________'

# Создаем коллекцию продуктов, передавая методу класса from_dir путь к папке
# с подпапками  films и books. ProductCollection сам знает как там внути лежат
# эти файлы и сам разберется, как и откуда их считать
collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')

# Сортируем продукты по возврастанию цены с помощью метода sort! экземпляра
# класса ProductCollection
collection.sort!(by: :count, order: :asc)

# Получаем массив продуктов методом to_a и выводим каждый на экран, передавая 
# его методу puts в качестве аргумента.
collection.to_a.each do |product|
  puts product
end

# Пытаемся вызвать метод  from_file у класса product и ловим ошибку
  begin 
    Product.from_file(current_path + "/data/films/01.txt")
  rescue NotImplementedError
    puts "Метод класса product.from_file не реализован"
  end
