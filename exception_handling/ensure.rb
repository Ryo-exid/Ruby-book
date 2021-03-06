 # ensure（例外処理を入れた場合、例外が発生していなくても必ず実行したい処理を記述したい場合）

begin
  # 例外が発生するかもしれない処理
rescue
  # 例外発生時の処理
ensure
  # 例外の有無に関わらず実行する処理
end

# ---------------------------------------


# 異常終了しても良いが、終了する前に必ず実行したい処理がある場合

begin
  # 例外が発生するかもしれない処理
ensure
  # 例外の有無に関わらず実行する処理
end


# ---------------------------------------


# 例外処理のelse  ※あまり使われない（begin節に例外が発生しなかった場合の処理を書けば良いから）

begin
  # 例外が発生するかもしれない処理
rescue
  # 例外発生時の処理
else
  # 例外が発生しなかった場合の処理
ensure
  # 例外の有無に関わらず実行する処理
end


# elseを使わない
begin
  puts 'Hello.'
  puts '例外は発生しませんでした。'
rescue
  puts '例外が発生しました。'
end

#=> Hello.
#   例外は発生しませんでした。



# ---------------------------------------


# コード例

# 書き込みモードでファイルを開く
file = File.open('some.txt', 'w')

begin
  file << 'Hello' # ファイルに文字列を書き込む
ensure
  # 例外の有無に関わらずファイルをクローズする
  file.close
end


# ---------------------------------------


# ensureの代わりにブロックを使う（ブロック付きでオープンすると、メソッドの実行後に自動的にクローズされる）

File.open('some.txt', 'w') do |file|
  file << 'Hello'
  # わざと例外を発生させる
  1 / 0
end

#=> ZeroDivisionError

# 例外は発生するものの、openメソッドによってクローズ処理自体は必ず行われる