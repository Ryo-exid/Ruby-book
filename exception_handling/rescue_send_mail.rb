# 大量のユーザにメールを送信する（例外が起きても最後まで続行する） ※ここでいう例外は変なメールアドレスを設定されていて、メールを送ることができない人がいる場合
users.each do |user|
  begin
    # メール送信を実行
    send_mail_to(user)
  rescue => e
    # 例外のクラス名、エラーメッセージ、バックトレースをターミナルに出力
    # (ログファイルがあればそこに出力するのがベター)
    puts "#{e.class}: #{e.message}"
    puts e.back_trace
  end
end


=begin


rescueをしたらその場で情報を残さないと詳細な情報が失われてしまう。

あとで原因調査ができるように、例外時の状況を確実に記録に残す。
最低でも発生したクラス名、エラーメッセージ、バックトレースの3つはログやターミナルに出力すべき。

※ 手がかりが多いほど原因調査が楽になるので、適切な対応が取れるよう、詳細な情報を確実に残しておく。


=end