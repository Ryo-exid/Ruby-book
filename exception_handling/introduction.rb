# 例外処理の流れ

# method_1にだけ例外処理を記述する
def method_1
  puts 'method_1 start.'
  begin
    method_2 # 例外が起こりうる処理
  rescue
    puts '例外が発生しました' # 例外が発生した場合の処理
  end
  puts 'method_1 end.'
end

def method_2
  puts 'method_2 start.'
  method_3
  puts 'method_2 end'
end

def method_3
  puts 'method_3 start.'
  # ZeroDivisionErrorを発生させる
  1 / 0
  puts 'method_3 end'
end

# 処理を開始する
p method_1

#=> method_1 start.
#   method_2 start.
#   method_3 start.
#   例外が発生しました
#   method_1 end.


# 例外が発生すると、そこで処理を中断してメソッドの呼び出しを一つずつ戻っていく。
# method_3, method_2と処理が戻っていくが、例外を捕捉するコードが無いので、さらにmethod_1に戻る。
# method_1で例外が捕捉され、"例外が発生しました"の文字列を出力している


puts "------------------------------------------------------"


=begin


例外オブジェクトから情報を取得する

-------------------------------------------
begin
  # 例外が起こりうる処理
rescue => 例外オブジェクトを格納する変数
  # 例外が発生した場合の処理
end
-------------------------------------------


=end

begin
  1 / 0
rescue => e # exeptionの省略形
  puts "エラークラス: #{e.class}"
  puts "エラーメッセージ: #{e.message}" # messageメソッド（例外発生時のエラーメッセージを返す）
  puts "バックトレース ======="
  puts e.backtrace # back_traceメソッド（メソッドの呼び出し履歴を配列にして返す）
  puts "========"
end

#=> エラークラス: ZeroDivisionError
#   エラーメッセージ: divided by 0
#   バックトレース =======
#   exception_handling/introduction.rb:62:in `/'
#   exception_handling/introduction.rb:62:in `<main>'
#   ========
