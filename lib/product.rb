class Product
  attr_accessor :name, :price, :count, :zhanr, :avtor, :age
  # В конструктор класса подаем параметр params
  # В качестве params будет будет использоваться Hash
  def initialize(params)
    @price = params[:price]
    @count = params[:count]
  end
  
  def to_s
    "#{@price} руб. (осталось #{@count})"
  end

  def update(params)
    @price = params[:price] if params[:price]
    @count = params[:count] if params[:count]
  end

  # Абстрактный метод from_file  для продукта не имеет смысла, т.к. абстрактный
  # продукт из файла мы прочитать не сможем (мы знаем, например, формат),
  # поэтому если он не определен у родителя, он будет возвращать ошибку. Класс
  # ошибки так и называется "ошибка отсутствия имлементации"

  def self.from_file(file_path)
    raise NotImplementedError
  end
end