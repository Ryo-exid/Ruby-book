# 例外発生時にもう一度処理をやり直すretry
# ネットワークエラーのように一時的に発生している問題が例外の原因であれば、何度かやり直すことで正常に実行できる可能性がある

begin
  # 例外が発生するかもしれない処理
rescue
  retry # 処理をやり直す
end


# retryし続けると、例外が解決し無い場合に無限ループを作ってしまう恐れがあるため、カウンタ変数でretryの回数を制限するのが良い

retry_count = 0
begin
  puts '処理を開始します'
  # わざと例外を発生させる
  1 / 0
rescue
  retry_count += 1
  if retry_count <= 3
    puts "retryします。（#{retry_count}回目）"
    retry
  else
    puts 'retryに失敗しました。'
  end
end

#=> 処理を開始します
#   retryします。（1回目）
#   処理を開始します
#   retryします。（2回目）
#   処理を開始します
#   retryします。（3回目）
#   処理を開始します
#   retryに失敗しました。