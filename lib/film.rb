# Создадим класс Film наследуемый от Product
class Film < Product
  attr_accessor :title, :year, :director
  # метод класса from_file считывает данные о фильме из файла, путь к которому 
  # ему передали в качестве параметра и передает их  на вход своему же
  # конструктору с нужными ключами.
  def self.from_file(file_path)
    lines = File.readlines(file_path, encoding: 'UTF-8').map {|l| l.chomp}

    self.new(
      title: lines[0],
      director: lines[1],
      yaer: lines[2].to_i,
      price: lines[3].to_i,
      count: lines[4].to_i
    )
  end

  def initialize(params)
    super

    @title = params[:title]
    @year = params[:yaer]
    @director = params[:director]
  end

  def to_s
    "Фильм '#{@title}', #{@year}, реж. #{@director}, #{super}"
  end
    
  def update(params)
    super
    
    @title = params[:title] if params[:title]
    @year = params[:yaer] if params[:yaer]
    @director = params[:director] if params[:director]
  end
end