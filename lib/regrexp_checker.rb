# 正規表現チェッカープログラム

print 'Text?: '
text = gets.chomp # chompと書くことで文字入力後リターンキーを押した時の改行文字（\n）を削除

# 例外処理を組み込んで再入力可能にする
begin
  print 'Pattern?: '
  pattern = gets.chomp
  regexp = Regexp.new(pattern)
rescue RegexpError => e
  puts "Invalid pattern: #{e.message}"
  retry
end

matches = text.scan(regexp)
if matches.size > 0
  puts "Matched: #{matches.join(', ')}"
else
  puts "Nothing matched."
end

#=> Text?: 123-456-789
#   Pattern?: [1-6+
#   Invalid pattern: premature end of char-class: /[1-6+/
#   Pattern?: [1-6]+
#   Matched: 123, 456