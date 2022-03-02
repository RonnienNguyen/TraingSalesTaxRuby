require File.expand_path(File.join(__FILE__, '..', 'item'))
require File.expand_path(File.join(__FILE__, '..', 'item_type'))

class Cart
	
		attr_accessor :item_list,
					  :total_cost,
					  :sales_tax
			
  	def initialize
			@item_list = Array.new  	
			@total_cost = 0.0
			@sales_tax = 0.0
  	end

		def add_to_cart(item)
			item_list << item	
		end
	
		def restart
			@total_cost = 0.0
			@sales_tax = 0.0
		end
		
		def total_cost
			'%.2f' % @total_cost
		end
		
		def sales_tax
		 '%.2f' % @sales_tax
		end
		
		def print_receipt
		 restart()
		 new = ' '
		 new.concat(self.to_s)
		 item_list.each do |item|
			 @total_cost+=item.giathue()
			 @sales_tax+=item.sales_tax
		 end
		 	new.concat("\n")
			new.concat("\nSales Tax: " + sales_tax)
			new.concat("\nTotal: " + total_cost)
		end	

		def to_s
			new = ' '
			item_list.each do |item|
				new.concat(item.to_s)
				
			end	
			new
		end
end 