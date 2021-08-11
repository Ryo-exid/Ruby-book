# begin/endを省略するrescue修飾子（ただし、補足する例外クラスを指定することができない） ※細かく制御する場合はbegin/end

# 例外が発生しそうな処理 rescue 例外が発生した時の戻り値

require 'date'

# 引数で渡された文字列をparseしてDateクラスのオブジェクトに変換するメソッド
def to_date(string)
  Date.parse(string) rescue nil
end

p to_date('2017-01-01') #=> #<Date: 2017-01-01 ((2457755j,0s,0n),+0s,2299161j)>
p to_date('abc') #=> nil



=begin


# begin/endを省略できるケース（メソッドの最初から最後までが例外処理の対象になっているメソッド）

def fizz_buzz(n)
  if n % 15 == 0
    'Fizz Buzz'
  elsif n % 3 == 0
    'Fizz'
  elsef n % 5 == 0
    'Buzz'
  else
    n.to_s
  end
rescue => e
  puts "#{e.class} #{e.message}"
end

p fizz_buzz(nil) #=> NoMethodError


=end