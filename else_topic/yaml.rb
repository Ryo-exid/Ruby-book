# YAMLは"YAML Ain't a Markup Langage"の略で、インデントを使ってデータの階層構造を表現するテキストフォーマットの一種。

require 'yaml'

# YAML形式のテキストデータを用意する
yaml = <<TEXT
alice:
  name: 'Alice'
  email: 'alice@example.com'
  age: 20
TEXT

# YAMLテキストをパースしてハッシュに変換
p users = YAML.load(yaml)
#=> {"alice"=>{"name"=>"Alice", "email"=>"alice@example.com", "age"=>20}}


# ハッシュに新しい要素を追加
users['alice']['gender'] = :female

# ハッシュからYAMLテキストに変換する
puts YAML.dump(users)
#=> ---
#   alice:
#     name: Alice
#     email: alice@example.com
#     age: 20
#     gender: :female