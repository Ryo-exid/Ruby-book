class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end
product = Product.new('A great movie', 1000)
p product.name #=> "A great movie"
p product.price #=> 1000



class DVD < Product # クラスの継承
  attr_reader :running_time # nameとpriceはスーパークラス（親クラス = super_product.rbのPriduct1クラス）で設定されているので定義不要

  def initialize(name, price, running_time)
    # スーパークラスのinitializeメソッドを呼び出す
    super(name, price)
    @running_time = running_time # DVDクラス独自の属性
  end
end

dvd = DVD.new('JOKER', 1000, 120)
p dvd.name #=> "JOKER"
p dvd.price #=> "1000"
p dvd.running_time #=> "120"