# クラス変数（クラスメソッド内でもインスタンスメソッド内でも共有され、尚且つスーパークラスとサブクラスでも共有される変数）

class Product
  @@name = 'Product'

  def self.name
    @@name
  end

  def initialize(name)
    @@name = name
  end

  def name
    @@name
  end
end

class DVD < Product
  @@name = 'DVD'

  def self.name
    @@name
  end

  def upcase_name
    @@name.upcase
  end
end

# DVDクラスを定義したタイミングで@@nameが"DVD"に変更される
p Product.name #=> "DVD"
p DVD.name     #=> "DVD"

product = Product.new('A great movie')
p product.name #=> "A great movie"

# Product.newのタイミングで@@nameが"A great movie"に変更される
p Product.name #=> "A great movie"
p DVD.name     #=> "A great movie"

dvd = DVD.new('An awesome film')
p dvd.name        #=> "An awesome film"
p dvd.upcase_name #=> "AN AWESOME FILM"

# DVD.newのタイミングで@@nameが"An awesome film"に変更される
p product.name #=> "An awesome film"
p Product.name #=> "An awesome film"
p DVD.name     #=> "An awesome film"


# @@nameの内容が変更されると他のクラスや他のインスタンスメソッドの実行結果が変わってしまう
# ライブラリ（gem）の設定情報（config値）を格納する場合などに使われることがある。