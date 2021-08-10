# prepend （同名のメソッドがあった時に、ミックスインしたクラスよりも先にモジュールのメソッドが呼ばれる）

module A
  def to_s
    "<A> #{super}"
  end
end

class Product
  # includeではなくprependを使う
  prepend A

  def to_s
    "<Product> #{super}"
  end
end

product = Product.new
p product.to_s #=> "<A> <Product> #<Product:0x0000000001a89b60>"


=begin

prependではなくincludeでモジュールAをミックスインした場合

p product.to_s #=> "<Product> <A> #<Product:0x0000000001a89b60>"

=end