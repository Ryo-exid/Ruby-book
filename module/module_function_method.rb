# モジュールではミックスインとしても使えて、なおかつモジュールの特異メソッドとしても使える一石二鳥なメソッドを定義
# （以下、module_functionメソッドを利用するモジュールのコード例）

module Loggable # モジュール関数（ミックスインとしてもモジュールの得意メソッドとしても使えるメソッドのこと）
  def log(text)
    puts "[LOG]#{text}"
  end

  # logメソッドをミックスインしても、モジュールの特異メソッドとして使えるようにする
  # （module_functionは対象メソッドの定義よりも下で呼び出すこと）
  module_function :log
end

# モジュールの特異メソッドとしてlogメソッドを呼び出す
Loggable.log('Hello.') #=> [LOG]Hello.


class Product
  include Loggable

  def title
    log 'title is called.'
    'A great movie'
  end
end

# ミックスインとしてlogメソッドを呼び出す
product = Product.new
p product.title
#=> [LOG]title is called.
#   "A great movie"


# --------------------------------------------


=begin


module_functionでモジュール関数となったメソッドは、他のクラスにミックスインすると自動的にprivateメソッドになる

logメソッドはprivateなので外部からは呼び出せない

p product.log 'Hello' #=> NoMethodError


=end


# --------------------------------------------


# module_function関数を引数なしで呼び出した場合

module Loggable
  # ここから下のメソッドはすべてモジュール関数になる
  module_function

  def log(text)
    puts "[LOG] #{text}"
  end
end