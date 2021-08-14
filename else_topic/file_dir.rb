=begin


# ファイルやディレクトリを扱うクラス

Fileクラス（requireなし）
Dirクラス（requireなし）
FileUtilsクラス
Pathnameクラス


=end

# カレントディレクトリに"secret.txt"が存在するか？
File.exists?('./secret.text')

# カレントディレクトリに"secret_folder"が存在するか？
Dir.exists?('./secret_folder')


# 以下、ファイルを読み書きする簡単なコード例

# libディレクトリにあるfizz_buzz.rbの行数をターミナルに表示
File.open('./lib/fizz_buzz.rb', 'r') do |f|
  puts f.readlines.count
end
#=> 19

# libディレクトリにhello_world.txtを作成して文字を書き込む
File.open('./lib/hello_world.txt', 'w') do |f|
  f.puts 'Hello, world!'
end