# 添字付きの繰り返し処理

# each_with_index(ブロック引数の第2引数に添え字を渡してくれる)

fruits = ['apple', 'orange', 'melon']
# ブロックの引数のiには0, 1 ,2...と要素の添え字が入る
fruits.each_with_index { |fruit, i| puts "#{i}: #{fruit}" }


puts '①---------------------------'


# with_index

fruits = ['apple', 'orange', 'melon']
# mapとして処理しつつ、添字も受け取る
p fruits.map.with_index { |fruit, i| "#{i}: #{fruit}" }


fruits = ['apple', 'orange', 'melon']
# 名前にaを含み、且つ添え字が奇数である要素を削除
p fruits.delete_if.with_index{ |fruit, i| fruit.include?('a') && i.odd? }


puts '②---------------------------'

# 添え字を0以外から始めたい場合

fruits = ['apple', 'orange', 'melon']
# with_indexメソッドに引数を渡す  ※ each_with_indexメソッドには引数を渡せない
fruits.each.with_index(1) { |fruit, i| puts "#{i}: #{fruit}" }


puts '③---------------------------'


# 配列がブロック引数に渡される場合

dimentions = [
  # [縦, 横]
  [10, 20],
  [30, 40],
  [50, 60],
]
#面積の計算結果を格納する配列
areas = []
# 配列の要素文だけブロック引数を用意すると、各要素の値が別々の変数に格納される
dimentions.each do |length, width|
  areas << length * width
end
p areas