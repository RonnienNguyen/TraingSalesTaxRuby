require File.expand_path(File.join(__FILE__, '..', 'loaithue'))

module TinhToan

  extend self
  
 	def tinhthue(item)
		item.loaithue() * item.price() 
 	end
 	 	
 	private
 	
 	def gettaxtype(item)
 	  if item.imported? && !item.exempted?
 	  	 TaxType::BOTH
 	  elsif item.imported? && item.exempted?
 	     TaxType::IMPORTED
 	  elsif !item.imported? && !item.exempted?
 	  	TaxType::BASIC
 	  else
 	  	TaxType::NA
 	  end
 	end
 	
 	
end