# Procはブロックをオブジェクト化するためのクラス

hello_proc = Proc.new { 'Hello' } # "Proc.new"ではなく、"proc"でも良い

p hello_proc.call # Procオブジェクトを実行したい場合はcallメソッドを使う
#=> "Hello"


add_proc = Proc.new { |a, b| a + b } # do/endでも可
p add_proc.call(10, 20)
#=> 30


add_proc = proc { |a = 0, b = 0| a + b }
p add_proc.call #=> 0
p add_proc.call(10) #=> 10
p add_proc.call(10, 20) #=> 30