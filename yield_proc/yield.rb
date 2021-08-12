def greeting
  puts 'おはよう'
  yield
  yield
  puts 'こんばんは'
end

greeting do
  puts 'こんにちは'
end

#=> おはよう
#   こんにちは
#   こんにちは
#   こんばんは


puts "---------------------------------------"


def greeting
  puts 'おはよう'
  text = yield 'こんにちは' # ブロックに引数を渡す
  puts text
  puts 'こんばんは'
end

greeting do |text|
  text * 2 # yieldで渡された文字列を2回繰り返す
end

#=> おはよう
#   こんにちはこんにちは
#   こんばんは