def default_args(a,b,c = 0, d = 0)
  "a=#{a}, b=#{b}, c=#{c}, d=#{d}"
end

puts default_args(1, 2)

puts default_args(1, 2, 3)

puts default_args(1, 2, 3, 4)



# 破壊的メソッド（ ! で終わるメソッド）　

a = 'ruby'

puts a.upcase # 大文字になる
puts a # aの値は変化しない


b = 'rails'

puts b.upcase! # 大文字になる
puts b # bの値も変化