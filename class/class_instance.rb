class Product
  # クラスインスタンス変数
  @name = name # クラスインスタンス変数は、インスタンスの作成とは無関係に、クラス自身が保持しているデータ（クラス自身のインスタンス変数）

  def self.name
    # クラスインスタンス変数
    @name
  end

  def initialize(name)
    # インスタンス変数
    @name = name # インスタンス変数は、クラスをインスタンス化（クラス名.newでオブジェクトを作成）した際に、オブジェクトごとに管理される変数
  end

  def name
    # インスタンス変数
    @name
  end
end

class DVD < Product # クラスの継承
  @name = 'DVD'

  def self.name
    @name # クラスインスタンス変数を参照
  end

  def upcase_name
    @name.upcase # インスタンス変数を参照
  end
end

p Product.name #=> "Product"
p DVD.name #=> "DVD"

product = Product.new('A great movie')
p product.name #=> "A great movie"

dvd = DVD.new('An awesome film')
p dvd.name #=> "An awesome film"
p dvd.upcase_name #=> "AN AWESOME FILM"