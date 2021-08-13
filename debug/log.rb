# Railsでデバッグ情報をログに出力するコード例

class User < ApplicationRecord
  def facebook_user_name
    info = facebook_user_name
    # ログに変数info.nameの値を出力する
    logger.debug "[DEBUG] info.name : #{info.name}"
    info.name
  end
end

# 上のコード例では"[DEBUG]"のような目印を付けたうえでログ出力している