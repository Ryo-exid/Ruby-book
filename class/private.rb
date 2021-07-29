# 後から公開レベルを変更する場合

class User
  # 一旦publicメソッドとして定義
  def foo
    'foo'
  end

  def bar
    'nar'
  end

  # fooとbarをprivate
  private :foo, :bar

  # bazはpublicメソッド
  def baz
    'baz'
  end
end

user = User.new
# user.foo #=> NoMethodError
# user.bar #=> NoMethodError
p user.baz #=> "baz"


puts '---------------------------'


=begin


privateメソッドは「クラスの外からは呼び出せず、クラスの内部でのみ使えるメソッド」（privateメソッドになるのはインスタンスメソッドだけ）

-------------------------------------------------------------
class User
  # ここから下で定義されたメソッドはprivate（privateメソッドではself付きで呼び出すとエラーになる ※レシーバーを指定して呼び出すことができないため）
  private

  def hello
    'hello'
  end

end

user = User.new
user.hello # 呼び出せない
-------------------------------------------------------------


=end



# オーバーライドも可能

class Product
  def to_s
    "name: #{name}"
  end

  private

  def name
    'A great movie'
  end
end

class DVD < Product
  private

  # スーパークラスのprivateメソッドをオーバーライド
  def name
    'An awesome film'
  end
end

product = Product.new
product.to_s #=> "name: A great movie"

dvd = DVD.new
p dvd.to_s  #=> "name: An awesome film"



=begin


クラスメソッドをprivateにしたい場合

-------------------------------------------------------------
class User
  class << self # この構文ならクラスメソッドでもprivateが機能する

  private

  def hello
    'Hello'
  end
end

User.hello #=> NoMethodError
-------------------------------------------------------------



class << selfを使わない場合
-------------------------------------------------------------
class User
  def self.hello
    'Hello'
  end

  # 後からクラスメソッドをprivateに変更する
  private_class_method :hello
end

User.hello #=> NoMethodError
-------------------------------------------------------------


=end