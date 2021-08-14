# CSVファイルを読み書きする場合はCSVクラスが使える。カンマ区切りだけではなく、タブ区切りのファイル（TSV）を読み書きすることも可能
require 'csv'

# CSVファイルの出力
CSV.open('./lib/sample.csv', 'w') do |csv|
  csv << ['Name', 'Email', 'Age'] # ヘッダ行を出力
  csv << ['Alice', 'alice@example.com', 20] # 明細行を出力
end

# タブ区切りのCSV（TSV）ファイルを読み込む
CSV.foreach('./lib/sample.tsv', col_sep: "\t") do |row|
  # 各行について、1列目から3列目の値をターミナルに表示
  puts "1: #{row[0]}, 2: #{row[1]}, 3: #{row[2]}"
end