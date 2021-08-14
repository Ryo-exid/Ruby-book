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