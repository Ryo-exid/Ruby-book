# ブロックを引数にするメリットは、ブロックを他のメソッドに引き渡せるようになること

# 以下、日本版と英語版のgreetingメソッドを用意する例

# 日本語版
def greeting_ja(&block) # 引数の手前に&を付けると、ブロックとみなされる
  texts = ['おはよう', 'こんにちは', 'こんばんは']
  greeting_common(texts, &block) # ブロックを別のメソッドに引き渡す
end

# 英語版
def greeting_en(&block)
  texts = ['good morning', 'hello', 'good evening']
  greeting_common(texts, &block)
end

# 出力処理専用の共通メソッド
def greeting_common(texts, &block)
  puts texts[0]
  puts block.call(texts[1]) # ブロックを実行
  puts texts[2]
end


# 日本語版を呼び出す
greeting_ja do |text|
  text * 2
end

#=> おはよう
#   こんにちはこんにちは
#   こんばんは


# 英語版を呼び出す
greeting_en do |text|
  text.upcase
end

#=> good morning
#   HELLO
#   good evening