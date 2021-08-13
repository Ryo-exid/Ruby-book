# tapでメソッドチェーンをデバッグする

# ブロック引数のsには、tapメソッドのレシーバ（ここでは文字列の"hello"）が入る
a = 'hello'.tap { |s| puts "<<#{s}>>"}
#=> <<hello>>

p a #=> "hello"