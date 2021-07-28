# /\d{3}-\d{4}/と書いた場合と同じ
Regexp.new('\d{3}-\d{4}')

# スラッシュで囲むと、スラッシュをエスケープする必要がある
/http:\/\/example\.com/

# %rを使うとスラッシュをエスケープしなくて良い
%r!http://example\.com!

# !ではなく{}を区切り文字にする
%r{http://example\.com}

# 変数が展開されるので/\d{3}-\d{4}/と書いたことと同じになる
pattern = '\d{3}-\d{4}'
p '123-4567' =~ /#{pattern}/ #=> 0


puts '①---------------------------'


# case文で正規表現を使う

text = '03-1234-5678'

case text
when /^\d{3}-\d{4}$/
  puts '郵便番号です'
when /^\d{4}\/\d{1,2}\/\d{1,2}$/
  puts '日付です'
when /^\d+-\d+-\d+$/
  puts '電話番号です'
end

#=> 電話番号です


puts '②---------------------------'


# 正規表現オブジェクト作成時のオプション


# iオプションを付けると大文字小文字を区別しない
p 'HELLO' =~ /hello/i #=> 0

# %rを使った場合も最後にオプションを付けられる
p 'HELLO' =~ %r{hello}i #=> 0

# Regexp.newを使う場合は、Regexp::IGNORECASEという定数を渡す
regexp = Regexp.new('hello', Regexp::IGNORECASE)
p 'HELLO' =~ regexp #=> 0