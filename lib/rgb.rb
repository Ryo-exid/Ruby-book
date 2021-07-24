# 10進数を16進数に変換するto_hexメソッド

=begin

 def to_hex(r, g, b)
   '#' +
     r.to_s(16).rjust(2, '0') +
     g.to_s(16).rjust(2, '0') +
     b.to_s(16).rjust(2, '0')
 end


上記コードをリファクタリングする

def to_hex(r, g, b)
  hex = '#'
  [r,g,b].each do |n|
    hex += n.to_s(16).rjust(2, '0')
  end
  hex
end

=end


#上記コードを更にリファクタリング

def to_hex(r, g, b)
  [r,g,b].inject('#') do |hex, n|
    hex + n.to_s(16).rjust(2, '0')
  end
end



# 16進数を10進数に変換するto_intsメソッド

=begin

def to_ints(hex)
  r = hex[1..2]
  g = hex[3..4]
  b = hex[5..6]
  ints = []
  [r, g, b].each do |s|
    ints << s.hex
  end
  ints
end

上記コードをリファクタリングする(初心者はここまででもOK)

def to_ints(hex)
  r, g, b = hex[1..2], hex[3..4], hex[5..6]
  [r, g, b].map do |s|
    s.hex
  end
end

=end


#上記コードを更にリファクタリング(上級編)

def to_ints(hex)
  hex.scan(/\w\w/).map(&:hex) # scanメソッドは正規表現にマッチした文字列を配列に返している
end