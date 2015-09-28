module ItemHelper
  def group_stock_items(stock)
    stock_items = Item.where(stock: stock)
    @grouped_stock_items = Hash.new
    for item in stock_items.each do
      if !@grouped_stock_items.has_key?(item.description.name)
        @grouped_stock_items[item.description.name] = { id: item.id, amount: 1 }
      else
        @grouped_stock_items[item.description.name][:amount] += 1
      end
    end
  end
end
