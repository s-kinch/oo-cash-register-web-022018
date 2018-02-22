class CashRegister

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = nil
  end

  attr_accessor :total
  attr_reader :discount, :items

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    quantity.times do
       @items << title
    end
    @last_transaction = price
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total -= 0.01 * @discount * total
      @total.round(2)
      @total = @total.round if @total.round == @total
      @discount = 0
      "After the discount, the total comes to $#{@total}."
    end
  end

  def void_last_transaction
    @total -= @last_transaction
    @items.pop
  end
end


reg = CashRegister.new(20)
reg.add_item("macbook", 1000)
reg.apply_discount
