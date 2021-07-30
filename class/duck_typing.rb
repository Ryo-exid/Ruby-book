# ダックタイピング（オブジェクトのクラスが何であろうとそのメソッドが呼び出せれば良しとするプログラミングスタイル）

class Product
  def initialize(name, price)
    @name = name
    @price = price
  end

  def display_text
    # stock?メソッドはサブクラスで必ず実装してもらう想定
    stock = stock? ? 'あり' : 'なし'
    "商品名: #{@name} 価格: #{@price}円　在庫: #{stock}"
  end
end

class DVD < Product
  # 在庫があればtrueを返す
  def stock?
    true
  end
end

product = Product.new('A great film', 1000)
# スーパークラスではstock?メソッドを持たないためエラーが起こる
# p product.display_text #=> NoMethodError

dvd = DVD.new('An awesome film', 3000)
# サブクラスはstock?メソッドを持つのでエラーが起きない
p dvd.display_text #=> "商品名: An awesome film 価格: 3000円　在庫: あり"



# -------------------------------------------------------------------


=begin

上記のような場合だと継承したときに突然エラーが出てびっくりしてしまうかもしれないので
Productクラス内でもstock?メソッドを定義し、分かりやすいメッセージとともにエラーを発生させる、といった手法を取る

=================================================================================================

class Product
  # 省略

  def stock?
    # 「サブクラスでstock?メソッドを実装すること」というメッセージとともにエラーを発生させる
    raise 'Must implement stock? in subclass.' # raiseは明示的にエラーを発生させるためのメソッド
  end
end

product = Product.new('A great film', 1000)
p priduct.display_text #=> RuntimeError: Must implement stock? in subclass.

=================================================================================================


=end