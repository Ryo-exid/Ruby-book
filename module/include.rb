# モジュールにログ出力のメソッドを定義し、クラスでそのモジュールをincludeすると、
# モジュールで定義したメソッドがインスタンスメソッドとして呼び出せるようになる


# ログ出力用のメソッドを提供するモジュール
# ログ出力できる（log + able）といういみでLogableという名前を付けた
module Logable
  private
  def log(text)
    puts "[LOG] #{text}"
  end
end

class Product
  # 上で作ったモジュールをincludeする
  include Logable

  def title
    # logメソッドはLogableモジュールで定義したメソッド
    log 'title is called.'
    'A great movie'
  end
end

class User
  # こちらも同じようにinclude
  include Logable

  def name
    # Logableモジュールのメソッドが使える
    log 'name is called.'
    'Alice'
  end
end

product = Product.new
p product.title
#=> [LOG] title is called.
#   "A great movie"

user = User.new
p user.name
#=> [LOG] name is called.
#   "Alice"


# モジュールをprivateにすれば、クラス外からは呼び出せないようになる
# p product.log 'public?' #=> NoMethodError