# シンボルと文字列の違い
p :apple.class #=> Symbol
p 'apple'.class #=> String

# 文字列よりもシンボルの方がメモリの使用効率が良い


# 文字列は破壊的な変更が可能

string = 'apple'
string.upcase!
p string


#シンボルはイミュータブル（不変）なので破壊的な変更は不可能


#シンボルをハッシュのキーにする
currencies = { :japan => 'yen', :us => 'dollar', :india => 'rupee' }
p currencies[:japan] # シンボルを使って値を取り出す（文字列より高速）


puts '①---------------------------'


# =>ではなく、"シンボル: 値"の記法でハッシュを作成
currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
p currencies[:us] # 値を取り出す時は同じ


puts '②---------------------------'


# ハッシュに格納する値は異なるデータ型が混在するケースがよくある
person = {
  name: 'Alice', #文字列
  age: 20, # 数値
  friends: ['Bob', 'Calol'], # 配列
  phones: { home: '1234-0000', mobile: '5678-0000' } # ハッシュ
}

p person[:age]
p person[:friends]
p person[:phones][:mobile]


puts '---------------------------'


=begin

メソッドのキーワード引数を使うと可読性が上がる

def メソッド名(キーワード引数1: デフォルト値1, キーワード引数2: デフォルト値2 )
  メソッドの実装
end

=end

def buy_burger(menu, drink: true, potato: true)
  # ハンバーガーを購入
  if drink
    # ドリンクを購入
  end
  if potato
    # ポテトを購入
  end
end

# チーズバーガーとドリンクとポテトを購入（キーワード引数を持つメソッドを呼び出す時は"シンボル: 値"）
buy_burger('cheese', drink: true, potato: true) # drink: true, potato: trueを省略しても良い

# フィッシュバーガーとドリンクを購入
buy_burger('fish', potato: false) # trueがデフォルトなので省略


# キーワード引数と一致するハッシュであれば、メソッドの引数として渡すことが出来る
params = { drink: true, potato: false }
buy_burger('fish', params)