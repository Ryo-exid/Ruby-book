# 3種類のProcオブジェクトを受け取り、それぞれのあいさつ文字列に適用するgreetingメソッド
def greeting(proc_1, proc_2, proc_3)
  puts proc_1.call('おはよう')
  puts proc_2.call('こんにちは')
  puts proc_3.call('こんばんは')
end

# greetingメソッドに渡すProcオブジェクトを用意
shuffle_proc = Proc.new { |text| text.chars.shuffle.join}
repeat_proc = Proc.new { |text| text * 2 }
question_proc = Proc.new { |text| "#{text}?" }

# 3種類のProcオブジェクトをgreetingメソッドに渡す
p greeting(shuffle_proc, repeat_proc, question_proc)

#=> はおうよ
#   こんにちはこんにちは
#   こんばんは?