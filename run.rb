require File.expand_path(File.join(__FILE__, '..', 'cart'))

item1 = Item.new(:name => "Music CD", :item_type => ItemType::OTHERS, :price => 14.99, :imported => false, :exempted => false)
item2 = Item.new(:name => "Book", :item_type => ItemType::BOOK, :price => 12.49, :imported => false, :exempted => true )
item3 = Item.new(:name => "ABC", :item_type => ItemType::FOOD, :price => 14.23, :imported => true, :exempted => true)
item4 = Item.new(:name => "FFE23", :item_type => ItemType::MEDICAL, :price => 22.33, :imported => false, :exempted => true)
item5 = Item.new(:name => "224GB", :item_type => ItemType::IMPORTED_MEDICAL, :price => 123.231, :exempted => false)
item6 = Item.new(:name => "NewName", :item_type => ItemType::BOOK, :price => 132.33, :imported =>  false, :exempted => false)


cart = Cart.new

cart.add_to_cart(item1)
cart.add_to_cart(item2)
cart.add_to_cart(item3)
cart.add_to_cart(item4)
cart.add_to_cart(item5)


puts cart.print_receipt
