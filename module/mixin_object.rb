# モジュールをミックスインする先はクラスになることが多いが、個々のオブジェクトに特異メソッドとしてミックスインすることもできる

# オブジェクトに直接ミックスインする
module Loggable
  def log(text)
    puts "[LOG]#{text}"
  end
end

s = 'abc'

# 文字列は通常logメソッドを持たない
# s.log('Hello.') #=> NoMethodError


s.extend(Loggable) # 文字列sにLoggableモジュールのメソッドを特異メソッド(特定のオブジェクトにだけ紐付くメソッド)としてミックスイン

p s.log('Hello.') #=> [LOG]Hello.