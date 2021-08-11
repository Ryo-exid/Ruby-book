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