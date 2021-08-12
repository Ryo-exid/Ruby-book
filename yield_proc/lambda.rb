# Proc.newの場合
 add_proc = Proc.new { |a, b| a.to_i + b.to_i }
 # Proc.newは引数が1つまたは3つでも呼び出しが可能
 p add_proc.call(10) #=> 10
 p add_proc.call(10,20,100) #=> 30


 puts "-----------------------------"


 # ラムダの場合
 add_lambda = ->(a, b) { a.to_i + b.to_i} # 引数で使っている()は省略可能

 # ラムダは引数が丁度でなければエラーになる
# p add_lambda.call(10) #=> ArgumentError
# p add_lambda.call(10, 20, 30) #=> ArgumentError
p add_lambda.call(20, 50) #=> 70