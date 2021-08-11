# 例外処理と戻り値

# 正常に終了した場合
ret =
  begin
    'OK'
  rescue
    'error'
  ensure
    'ensure'
  end

p ret #=> "OK"


# 例外が発生した場合
ret =
  begin
    1 / 0
    'OK'
  rescue
    'error'
  ensure
    'ensure'
  end

p ret #=> "error"


# 例外が発生せず、最後まで正常に処理が進んだ場合はbegin節の最後の式が戻り値になる。
# 例外が発生してその例外が捕捉された場合はrescue節の最後の式が戻り値になる。


# ensureではreturnを使わない（例外の発生自体が取り消されてしまうため）