require File.expand_path(File.join(__FILE__, '..', 'tinhtoan'))
require File.expand_path(File.join(__FILE__, '..', 'item_type'))

class Item

  include TinhToan
  
	attr_accessor :name,
	              :price,
	              :item_type,
	              :imported,
	              :exempted
	
	
	def initialize(attrs)
		@name  = attrs[:name]
		@price = attrs[:price]
		@item_type = attrs[:item_type]	
		@imported  = attrs[:imported]
		@exempted  = attrs[:exempted]
	end
		
	def to_s 
		self.name +  ": " + giathue().to_s 
	end
	
	def imported?
	 !!imported
	end

	def exempted?
	 [ItemType::BOOK,  ItemType::MEDICAL, ItemType::FOOD].include?(item_type)
	end
		
	def giathue()

   		((calculate_sales_tax() + self.price)*100).round/100.0
	end
	
  def calculate_sales_tax()
	 @sales_tax||=TinhToan.tinhthue(self)
	end
	
	def sales_tax
		@sales_tax
	end
	
	def loaithue
		if imported? && exempted?
			TaxType::BASIC
		elsif imported? && exempted?
			TaxType::IMPORTED
		elsif imported? && !exempted?
			TaxType::BOTH
		else
			TaxType::NULL
		end
	end
 	
end