# Enumerableモジュールは配列やハッシュ、範囲（Range）など、何かしらの繰り返し処理ができるクラスにincludeされているモジュール
# Enumerableモジュールをincludeしているクラスであれば、メソッドはいずれも呼び出せる => map select find count

p [1,2,3].map { |n| n * 10 } #=> [10, 20, 30]
p (1..3).map { |n| n * 10 } #=> [10, 20, 30]

p [1, 2, 3].count #=> 3
p (1..3).count #=> 3