=begin


Comparableモジュールは比較を可能にするモジュール < <= == > >= between?
Comparableモジュールを使えるようにする条件は、include先のクラスで<=>演算子を実装しておくこと

<=>演算子は「UFO演算子」とも呼ばれる

・aがbよりも大きいのなら正の整数
・aとbが等しいなら0
・aがbより小さいなら負の整数
・aとbが比較できない場合はnil


=end


p 2 <=> 1 #=> 1
p 2 <=> 2 #=> 0
p 1 <=> 2 #=> -1
p 2 <=> 'abc' #=> nil


puts '---------------------------'


p 'xyz' <=> 'abc' #=> 1
p 'abc' <=> 'abc' #=> 0
p 'abc' <=> 'xyz' #=> -1
p 'abc' <=> 123 #=> nil


puts '---------------------------'


class Tempo
  include Comparable

  attr_reader :bpm

  # bpmはBeatsPerMinuteの略で音楽の速さを表す単位
  def initialize(bpm)
    @bpm = bpm
  end

  def <=>(other)
    if other.is_a?(Tempo)
      bpm <=> other.bpm # bpm同士を<=>で比較した結果を返す
    else
      nil # 比較できない場合はnilを返す
    end
  end

  # 結果を見やすくするためにinspectメソッドをオーバーライド
  def inspect
    "#{bpm}bpm"
  end
end


# 大小関係を比較

p t_120 = Tempo.new(120) #=> 120bpm
p t_180 = Tempo.new(180) #=> 180bpm

p t_120 > t_180 #=> false
p t_120 <= t_180 #=> true
p t_120 == t_180 #=> false

# <=>演算子のおかげで、Tempoクラスは比較演算子を使って大小を比較できるようになった。


# <=>演算子は並び替えを行う際にもよく利用される。

tempos = [Tempo.new(180), Tempo.new(60), Tempo.new(120)]

# sortメソッドの内部では並び替えの際に<=>演算子が使われる
p tempos.sort #=> [60bpm, 120bpm, 180bpm]