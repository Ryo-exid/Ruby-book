# メソッドのオーバーライド
class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  # to_sはオブジェクトの内容を文字列に変換して返すメソッド
  def to_s
    "name: #{name}, price: #{price}"
  end
end

class DVD < Product
  attr_reader :running_time

  def initialize(name, price, running_time)
    super(name, price)
    @running_time = running_time
  end

  # オーバーライド（スーパークラスの処理を上書き）
  def to_s
    "#{super}, running_time: #{running_time}"
  end
end

dvd = DVD.new('An awesome film', 3000, 120)
p dvd.to_s
#=> "name: An awesome film, price: 3000, running_time: 120"