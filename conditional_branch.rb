=begin
優先順位

高い !
    &&
    ||
    not
低い and or

=end


t1 = true
t2 = true
f1 = false

# 左から順番に真偽値が評価

# &&は||よりも優先順位が高い
t1 || (t2 && f1)

# andとorの優先順位は同じなので左から順に評価
(t1 or t2) and f1


# 条件演算子（if/else文よりスッキリ書けるが、かえって読みづらくならないように考慮する）
 n = 11
 puts n > 10 ? '10より大きい' : '10以下'


# if文が値を返すので変数に代入できる
a =
  if true
    '真です'
  else
    '偽です'
  end

puts a