# ミュータブルなオブジェクト（文字列、配列、ハッシュ）であれば定数は変更できてしまう

class Product
  DEFAULT_PRICE = 0

  # 再代入自体は成功してしまう すでに初期化済みである（warning: already initialized constant Product::DEFAULT_PRICE）と警告は表示される
  DEFAULT_PRICE = 1000

  NAME = 'A product'
  SOME_NAMES = ['Foo', 'Bar', 'Baz']
  SOME_PRICES = { 'Foo' => 1000, 'Bar' => 2000, 'Baz' => 3000}
end

# 外部から定数を参照する（再代入後の値が入る）
p Product::DEFAULT_PRICE #=> 1000

# 文字列を破壊的に大文字に変更
Product::NAME.upcase!
p Product::NAME #=> "A PRODUCT"

# 配列に新しい要素を追加
Product::SOME_NAMES << 'Hoge'
p Product::SOME_NAMES #=> ["Foo", "Bar", "Baz", "Hoge"]

# ハッシュに新しいキーと値を追加
Product::SOME_PRICES['Hoge'] = 4000
p Product::SOME_PRICES #=> {"Foo"=>1000, "Bar"=>2000, "Baz"=>3000, "Hoge"=>4000}