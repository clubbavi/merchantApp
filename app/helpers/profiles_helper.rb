module ProfilesHelper
  
  def selected_product(catid)
     category = Category.find(catid)
      @product = category.products.all
   puts @product.inspect
   puts "-----------------"
   return @product
  end

  def old_question_answere(pid, qid)
     puts "-----------------"
    profile_answere = ProfileAnswere.find_by(:question_id=> qid, :profile_id => pid)
      
   puts ans = profile_answere.answere
   puts "-----------------"
   return ans
  end
  
 def selected_sections(profid)
    @sections  = []
      puts "--------section---------"
      puts prod = profid.split(',')
      products = Product.find(prod)
      puts products.inspect
      products.each do |p|
       @sections << p.sections.all
       puts @sections.inspect
      #@sections = @sections.uniq { |x| x[:id] }  
      end          
   puts @sections.inspect
   puts "--------section---------"
   return @sections
 end
  
end
