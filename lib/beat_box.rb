class BeatBox 
  
  attr_reader :list 

  def initialize
    @list = LinkedList.new 
  end

  def count
    @list.count 
  end 

  def append(data)
    if data.is_a?(String)
       
      words = data.split
         words.each do |word|
          if word.length <=10
            @list.append(word)
          else 
            next 
          end 
        end 
    else 
      return "Invalid Entry"
    end 
  end 


end 