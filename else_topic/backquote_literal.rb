# バッククオートリテラルはバッククオートで囲まれた文字列をOSコマンドとして実行する

puts `cat lib/fizz_buzz.rb`

#=> def fizz_buzz(n)
#     if n % 15 == 0
#      'Fizz Buzz'
#     elsif n % 3 == 0
#      'Fizz'
#.  以下省略