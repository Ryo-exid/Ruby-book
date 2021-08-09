# モジュールに定数を定義する

module Loggable
  PREFIX = '[LOG]'.freeze # 定数を定義する

  def log(text)
    puts "#{PREFIX} #{text}"
  end
end

# 定数を参照する
p Loggable::PREFIX #=> "[LOG]"


# ------------------------------------------


# Mathモジュール（Rubyの組み込みライブラリ）
# Mathモジュールのメソッドはモジュール関数になっているため、モジュールの特異メソッドとしても、ミックスインとしても利用可能


# モジュールの特異メソッドとしてsqrt（平方根）メソッドを利用する
p Math.sqrt(2) #=> 1.4142135623730951

class Caluculator
  include Math

  def calc_sqrt(n)
    # ミックスインとしてMathモジュールのsqrtメソッドを使う
    sqrt(n)
  end
end

calculator = Caluculator.new
p calculator.calc_sqrt(2) #=> 1.4142135623730951


# また、Mathモジュールには自然対数の底を表すEと、円周率を表すPIという定数が定義されている
p Math::E #=> 2.718281828459045
p Math::PI #=> 3.141592653589793