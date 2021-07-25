# さまざまな繰り返し処理

# timesメソッド
sum = 0
# sumに1を加算する処理を5回繰り返す
5.times { sum += 1 }
p sum


# uptoメソッド(数値を1ずつ増やす)
a = []
10.upto(14) { |n| a << n }
p a #=> [10, 11, 12, 13, 14]


# downtoメソッド(数値を1ずつ減らす)
a = []
14.downto(10) { |n| a << n }
p a


# stepメソッド
a = []
# 1から10まで2ずつ値を増やしながら処理をする場合
1.step(10, 2) { |n| a << n }
p a #=> [1, 3, 5, 7, 9]


a = []
# 10から1まで2ずつ値を減らす場合
10.step(1, -2) { |n| a << n }
p a


puts '①---------------------------'


# while文(真であれば実行)　繰り返し処理

a = []
while a.size < 5
  a << 1
end
p a

# 上の処理は1行で書くこともできる
a = []
while a.size < 5 do a << 1 end
p a


# begin...endで囲むとどんな条件でも最低一回は実行される
a = []
begin
  a << 1
end while false
p a


puts '②---------------------------'


# until文(偽であれば実行)　繰り返し処理

a = [10, 20, 30, 40, 50]
# 配列の要素数が3以下になるまで配列の要素を後ろから削除していくコード例
until a.size <= 3
  a.delete_at(-1)
end
p a


puts '③---------------------------'


# for文  繰り返し処理

# for文の中で作成された変数はfor文の外でも参照できる　※each文はブロック引数やブロック内で作成した変数は、ブロックの外では参照できない
numbers = [1, 2, 3, 4]
sum = 0
for n in numbers
  # 条件演算子 もしn(numbersという配列の中の個数)が偶数だったらnを10倍する、そうでなければn(そのまま)
  sum_value = n.even? ? n * 10 : n
  sum += sum_value
end

p n #=> 4
p sum_value #=> 40


puts '④---------------------------'


# loopメソッド(変数がループの外で参照できない)

=begin

loop do
  無限ループ用の処理
end

=end

numbers = [1, 2, 3, 4, 5]
loop do
  # sampleメソッドでランダムに要素を一つ取得する
  n = numbers.sample
  puts n
  break if n == 5 # 5が出たタイミングで無限ループ脱出
end


puts '⑤---------------------------'


# 変数がループの外で参照できる

=begin

while true
  無限ループ用の処理
end

=end

numbers = [1, 2, 3, 4, 5]
while true
  n = numbers.sample
  puts n
  break if n == 5
end