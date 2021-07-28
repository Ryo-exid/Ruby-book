class User
  def initialize(name)
    @name = name
  end

  # self.を付けるとクラスメソッドになる
  def self.create_users(names)
    names.map do |name|
      User.new(name)
    end
  end

  # インスタンスメソッド
  def hello
    "Hello, I am #{@name}"
  end
end

names = ['Alice', 'Bob', 'Carol']
# クラスメソッドの呼び出し
users = User.create_users(names)
users.each do |user|
  # インスタンスメソッドの呼び出し
  puts user.hello
end

#=> Hello, I am Alice
#   Hello, I am Bob
#   Hello, I am Carol



=begin


定数

--------------------------------------------------------------------------------------
class Product
  DEFAULT_PRICE = 0 # 定数（必ず大文字で始める）

  # 定数はインスタンスメソッド内でもクラスメソッド内でも同じ方法で参照することが出来る

  def self.default_price
    DEFAULT_PRICE # クラスメソッドから定数を参照する
  end

  def default_price
    DEFAULT_PRICE # インスタンスメソッドから定数を参照する
  end
end

Product.default_price #=> 0

product = Product.new
product.default_price
--------------------------------------------------------------------------------------


=end