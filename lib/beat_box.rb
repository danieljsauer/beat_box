class BeatBox 
  attr_reader :list, :data, :rate, :voice 
  attr_accessor :rate, :voice 

  def initialize(data = nil)
    @list = LinkedList.new 
    @data = data
    prepend(data)
    @rate = 250
    @voice = "Daniel"
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

  def prepend(data)
    if data.is_a?(String)
       
      words = data.split.reverse
      words.each do |word|
        if word.length <=10
          @list.prepend(word)
        else 
          next 
        end 
      end 

    else 
      return "Invalid Entry"
    end 
  end 

  def play
    beat = @list.to_string
    `say -r #{rate} -v #{voice} "#{beat}"`
    beat 
  end 

  def reset_rate
    @rate = 250
  end 

  def reset_voice
    @voice = "Daniel"
  end

  def rap_battle(voice1 = "Karen", voice2 = "Rishi")
    verse = @list.to_string
    half_length = (verse.length/2)

    first_half = verse[0, half_length]
    second_half = verse[half_length , half_length]
    
    @voice = voice1
    `say -r 250 -v #{voice} "#{first_half}"`
    @voice = voice2
    `say -r 250 -v #{voice} "#{second_half}"`
    verse 
  end 
  
end 