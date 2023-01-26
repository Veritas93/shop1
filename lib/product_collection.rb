  # Класс ProductCollection, который может считывать все нужные продукты из 
  # подкатегорий film, book
class ProductCollection
  # Создадим константу со всеми возможными типами продуктов. ассоциативный массив
  # массив, где ключем является символ, а значением - другой ассоциативный массив
  # массив с названием папки (где лежат файлы этого типа и ссылкой на класс)

  PRODUCT_TYPES ={
    film: {dir: 'films', class: Film},
    book: {dir: 'books', class: Book}
  }
  #  Конструктор коллекции получает на вход массив продуктов, но если ничего нет,
  #  то он записывает в переменную @products пустой массив

  def initialize(products = [])
    @products = products
  end
  
  # Метод считывания продуктов из папки Data сам определяет, какие товары (фильмы или книги в какой папке лежат)
  # создаем пустой массив в котором будут все найденые продукты
  def self.from_dir(dir_path)
    products = []
  
    # Пройдемся по каждой паре ключ-значений из константы PRODUCT_TYPES и 
    # поочередно запишем эту пару соответственно в переменные type и hash'
    PRODUCT_TYPES.each do |type, hash|
    
    # Получим из хеша путь к директории с файлами нужного типа например 
    # строку films
    product_dir = hash[:dir]
    product_class = hash[:class]
    
    # Для каждого текстового файла из директории, например "/data/films"
    # берем путь к файлу и передаем его в метод класса from_file, вызывая его
    # у объекта нужного класса
    Dir[dir_path + "/" + product_dir + '/*.txt'].each do |path|
      products << product_class.from_file(path)
    end
  end

    
  # Вызовем конструктор этго же класса (ProductCollection) и передаем ему 
  # Заполненый массив продуктов
  self.new(products)
  end
  
  # Метод возвращает массив товаров
  def to_a
    @products
  end
  
  # Метод сортирует товары по цене, остатку на складе или по названию (как по
  # возврастанию так и по убыванию) Метод принимает на вход ассоциативный массив,
  # в котором могут быть два ключа :by и :order
  def sort!(params)
    # Делает выбор по параметру by
    case params[:by]
    when :title
      @products.sort_by!{|product| product.to_s}
    when :price
      @products.sort_by!{|product| product.price}
    when :count
      @products.sort_by!{|product| product.count}
    end

    # Если запросили сортировку по возврастанию 
    @products.reverse! if params[:order] == :asc

    # Возвращаем ссылку на экземпляр, чтобы у него по цепочке можно было вызвать 
    # другие методы
    self
  end
end