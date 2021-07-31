require './lib/deep_freezable'

class Team
  # deep_freezeメソッドが呼ばれているのはクラス構文の直下。クラス構文の直下ではクラスメソッドしか呼び出せない。
  # よって、deep_freezeメソッドはクラスメソッド（特異メソッド）としてミックスインする必要がある。 ※ includeではなくextendを使っているのはそのため。
  extend DeepFreezable

  COUNTRIES = deep_freeze(['Japan', 'US', 'India'] )
end
