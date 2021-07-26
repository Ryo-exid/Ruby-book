=begin

シンボルを作成する方法（以下の$はグローバル関数の、@はインスタンス変数の識別子として有効）

:apple
:Apple
:ruby_is_fun
:okay?
:welcome!
:_secret
:$dollar
:@at_mark



シンボルとして作れない文字列（数字やハイフン、スペースが含まれる文字列）も、シングルクォーとで囲むとシンボルとして有効になる

:'12345'
:'ruby-is-fun'
:'ruby is fun'
:'()'

=end


# ダブルクォートを使うと、文字列と同じように式典会を使うことが出来る

name = 'Alice'
p :"#{name.upcase}" #=> :ALICE


# "文字列: 値"の形式で書くと、キーがシンボルになる
p hash = { 'abc': 123 } #=> {:abc=>123}


puts '①---------------------------'


# %記法を使ってシンボルを作成
p %s!ruby is fun! #=> :"ruby is fun"

# ()を区切り文字に使う
p %s(ruby is fun) #=> :"ruby is fun"


puts '②---------------------------'


# シンボルの配列を作成する場合は、%iを使用
p %i(apple orange melon) #=> [:apple, :orange, :melon]


name = 'Alice'

# %iでは改行文字や式展開の構文が、そのままシンボルになる
p %i(hello\ngood-bye #{name.upcase}) #=> [:"hello\\ngood-bye", :"\#{name.upcase}"]


# %Iでは改行文字や式展開の構文が有効になった上でシンボルが作られる
p %i(hello\ngood-bye #{name.upcase}) #=> 