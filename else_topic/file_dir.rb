=begin


# ファイルやディレクトリを扱うクラス

Fileクラス（requireなし）
Dirクラス（requireなし）
FileUtilsモジュール
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


# FileUtilsモジュールは基本的なファイル操作を集めたモジュール。
require 'fileutils'

# libディレクトリのhello_world.txtをhello.rbにRenameする
FileUtils.mv('./lib/hello_world.txt', './lib/hello_world.rb')


# Pathnameはパス名をオブジェクト指向らしく扱うクラス
require 'pathname'

# カレントディレクトリ配下にあるlibディレクトリを表すオブジェクトを作る
lib = Pathname.new('./lib')

# ファイルか？
p lib.file? #=> false

# ディレクトリか?
p lib.directory? #=> true

# libディレクトリ配下にあるsample.txtへのパス文字列を作る（スラッシュは自動的に付与される）
p lib.join('sample.txt').to_s
#=> "./lib/sample.txt"