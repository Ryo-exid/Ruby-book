# NameErrorとNoMethodErrorの継承関係
# NoMethodError → NameError → StandardError → Exeption  ※順番に注意しないと永遠に実行されないrescue節になってしまう

begin
  # NameErrorを発生させる
  Foo.new
rescue NoMethodError
  puts 'NoMethodErrorです'
rescue NameError
  puts 'NameErrorです'
end
#=> NameErrorです


# 最後にStandardErrorクラスを指定すれば、通常のプログラミングで発生するその他のエラーをまとめて補足することが出来る

begin
  # ZeroDivisionErrorを発生させる
  1 / 0
rescue NoMethodError
  puts 'NoMethodErrorです'
rescue NameError
  puts 'NameErrorです'
rescue # StandardError
  puts 'その他のエラーです'
end
#=> その他のエラーです


=begin


ただし、安易にrescueを使わない！（rescueすべき例外の方が少ない）

プログラミング初心者の場合は、「例外が発生したらrescueで対処すれば良いんだな」と考えるのではなく、
「例外が発生したら即座に異常終了させよう」もしくは「フレームワークの共通処理に全部丸投げしよう」と考える方が安全。


=end