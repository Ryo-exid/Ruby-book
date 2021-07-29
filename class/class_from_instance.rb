# インスタンスメソッドからクラスメソッドを呼び出す

class Product
  attr_reader :name, :price # attr_reader はゲッターと同じ役割。インスタンス変数の内容をクラス外から参照できる。

  def initialize(name, price)
    @name = name
    @price = price
  end

  # 金額を整形するクラスメソッド
  def self.format_price(price)
    "{price}円"
  end

  def to_s
    # インスタンスメソッドからクラスメソッドを呼び出す
    formatted_price = Product.format_price(price) # クラス名.メソッド（self.class.メソッド と書く場合もある）
    "name: #{name}, price: #{formatted_price}"
  end
end

product = Product.new('A great movie', 1000)
p product.to_s
#=> "name: A great movie, price: {price}円"