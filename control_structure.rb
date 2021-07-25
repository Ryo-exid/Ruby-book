# 繰り返し処理用の制御構造

=begin

※ breakでは一番内側の処理しか脱出できない


一気に外側のループまで脱出したい場合　（throwとcatchを使った大域脱出）

catch タグ do
  繰り返し処理など
  throw タグ
end

=end

fruits = ['apple', 'melon', 'orange']
numbers = [1, 2, 3]
catch :done do # タグには通常シンボルを使用
  fruits.shuffle.each do |fruit|
    numbers.shuffle.each do |n|
      puts "#{fruit}, #{n}"
      if fruit == 'orange' && n ==3
        # 全ての繰り返し処理を脱出する
        throw :done # throwとcatchのタグが一致しない場合はエラーが発生する
      end
    end
  end
end

# catchとthrowは繰り返し処理と無関係に使うこともできる（ただし実際は繰り返し処理の大域脱出で使用されることが多い）


puts '①---------------------------'


# next（繰り返し処理を途中で中断し、次の繰り返し処理に進める場合）


numbers = [1, 2, 3, 4, 5]
numbers.each do |n|
  # 偶数であれば中断して次の繰り返し処理に進む
  next if n.even?
  puts n
end

# nextはeach文以外にもwhile文,until文,for文でも使える


puts '②---------------------------'

# redo（繰り返し処理をやり直したい場合）　※初回からやり直すのではなく、その回の繰り返し処理の最初に戻るという意味

foods = ['ピーマン', 'トマト', 'セロリ']
foods.each do |food|
  print "#{food}は好きですか？"
  # sampleは配列からランダムに1要素を取得するメソッド
  answer = ['はい', 'いいえ'].sample
  puts answer

  # 「はい」と答えなければもう一度聞き直す
  redo unless answer == 'はい'
end


puts '③---------------------------'


# やり直し回数の制限

foods = ['ピーマン', 'トマト', 'セロリ']
count = 0
foods.each do |food|
  print "#{food}は好きですか？"
  # わざと「いいえ」しか答えないようにする
  answer = 'いいえ'
  puts answer

  count += 1

  # やり直しは2回までにする
  redo if answer != 'はい' && count < 2

  # カウントをリセット
  count = 0
end