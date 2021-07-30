# モンキーパッチ（既存の実装を上書きして、自分が期待する挙動に変更すること） ※弊害が出る恐れもあるので注意

# 以下のUserクラスは外部ライブラリで定義されている想定
class User
  def initialize(name)
    @name = name
  end

  def hello
    "Hello, #{@name}!"
  end
end

# モンキーパッチを当てる前の挙動を確認
user = User.new('Alice')
p user.hello #=> "Hello, Alice!"

# helloメソッドにモンキーパッチをあてて独自の挙動を持たせる
class User
  def hello
    "#{@name}さん、こんにちは！"
  end
end

# メソッドの定義を上書きしたのでhelloメソッドの挙動が変わっている
p user.hello
#=> "Aliceさん、こんにちは！


puts '---------------------------'


# 応用version

# 以下のUserクラスは外部ライブラリで定義されている想定
class User
  def initialize(name)
    @name = name
  end

  def hello
    "Hello, #{@name}!"
  end
end

# モンキーパッチをあてるためにUserクラスを再オープンする
class User
  # 既存のhelloメソッドはhello_originalとして呼び出せるようにしておく
  alias hello_original hello # エイリアスメソッド（別の名前でも全く同じ動作をする別名メソッド）を定義
  # alias 新しい名前 元の名前

  # helloメソッドにモンキーパッチをあてる（元々実装されていたhelloメソッドも再利用する）
  def hello
    "#{hello_original}じゃなくて、#{@name}さん、こんにちは！"
  end
end

# モンキーパッチをあてたhelloメソッドの挙動を確認する
user = User.new('Alice')
p user.hello #=> "Hello, Alice!じゃなくて、Aliceさん、こんにちは！"


# 実際の開発では外部ライブラリに軽微な不具合があったり、微妙に要件に合わない挙動があったりしたときに、モンキーパッチをあてて挙動を変えることがある。

# 強力な機能だが、基本的にはオープンクラスやモンキーパッチに頼らずに要件を満たすコードが書けないかを検討する。
# ライブラリのバージョンを上げた際にライブラリ本体と整合性がとれなくなり、予期せぬタイミングでエラーが発生するなどの弊害がある。