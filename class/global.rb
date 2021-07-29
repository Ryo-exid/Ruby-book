# （注意）グローバル変数に依存するようなプログラムを書くことは避けるべき！ ※特別な理由がない限り
# グローバル変数の乱用は理解しずらいプログラムの原因になる（以上を踏まえた上で学習する）


# グローバル変数（$で変数名を始める。クラスの内部、外部を問わず、プログラムのどこからでも変更、参照が可能）

# グローバル変数の宣言と値の代入
$program_name = 'Awesome program'

# グローバル変数に依存するクラス
class Program
  def initialize(name)
    $program_name = name
  end

  def self.name
    $program_name
  end

  def name
    $program_name
  end
end

# $program_nameには既に名前が代入されている
p Program.name #=> "Awesome program"

program = Program.new('Super program')
p program.name #=> "Super program"

# Program.newのタイミングで$program_nameが"Super program"に変更される
p Program.name #=> "Super program"
p $program_name #=> "Super program"



# 他にも、$で始まる組み込み変数や特殊変数を多用すると記号の意味を知っている人しか理解出来ないコードになってしまう為、
# 極力使用は避け、他の人が理解しやすいコードを書くことを心掛ける。