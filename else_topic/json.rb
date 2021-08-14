# JSONは"JavaScript Object Notation"の略で、JavaScriptと互換性のあるテキストフォーマットの一種。
# シンプルかつ軽量にオブジェクトの内容を表現できるため、JavaScriptだけでなくさまざまな言語やWebサービス間でデータを交換する時によく使われる。

require 'json' # 配列やハッシュでto_jsonメソッドが使えるようになる

user = { name: 'Alice', email: 'alice@example.com', age: 20 }

# ハッシュをJSON形式の文字列に変換する
user_join = user.to_json
puts user_join #=> {"name":"Alice","email":"alice@example.com","age":20}


# JSON文字をパースしてハッシュに変換（キーはシンボルではなく文字列になる）
p JSON.parse(user_join) #=> {"name"=>"Alice", "email"=>"alice@example.com", "age"=>20}