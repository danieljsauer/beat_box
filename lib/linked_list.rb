class LinkedList
  attr_reader :head
  
  def initialize
    @head = nil
  end
  
  def append(data)
    if data.is_a?(String) && data.length <= 10 

      new_node = Node.new(data)
  
      if @head == nil 
        @head = new_node
      else
        current_node = @head
        until current_node.next_node_pointer == nil 
          current_node = current_node.next_node_pointer
        end
        current_node.next_node_pointer = new_node
      end

    else 
      return "Invalid Entry"
    end 
  end

  def prepend(data) 
    if data.is_a?(String) && data.length <= 10 

      old_head = @head 
      @head = Node.new(data)
      head.next_node_pointer = old_head

    else 
      return "Invalid Entry"
    end 
  end 

  def insert(index, data)
    if data.is_a?(String) && data.length <= 10 && index.is_a?(Integer) && index <= count 

      if index == 0
        prepend(data)

      else
        new_node = Node.new(data)
        prior_node = @head 
        (index - 1).times do 
          prior_node = prior_node.next_node_pointer 
        end 
        new_node.next_node_pointer = prior_node.next_node_pointer
        prior_node.next_node_pointer = new_node
      end    
      
    else 
      return "Invalid Entry"
    end 
  end 

  def count
    if @head == nil 
      return 0

    else 
      counter = 1
      current_node = @head 
      until current_node.next_node_pointer == nil 
        current_node = current_node.next_node_pointer
        counter += 1
      end
      return counter
    end 
  end 

  def to_string 
    if @head == nil 
      return "No items in list"

    else
      items = []
      current_node = @head 
      items << current_node.data 
      until current_node.next_node_pointer == nil 
        current_node = current_node.next_node_pointer
        items << current_node.data 
      end
    end

    items = items.join(" ")
    return items
  end  

  def find(index, number)
    @head == nil ? (return "List is empty") : nil 
    if index.is_a?(Integer) && index <= count && number.is_a?(Integer)

      selected = []
      current_node = @head 
      index.times do 
        current_node = current_node.next_node_pointer
      end 
      number.times do 
        if current_node == nil 
          break
        else 
          selected << current_node.data
          current_node = current_node.next_node_pointer
        end  
      end  

      selected = selected.join(" ")

    else 
      return "Invalid Entry"
    end 
  end 

  def includes?(data)
    @head == nil ? (return "List is empty") : nil 
    if data.is_a?(String) && data.length <= 10

      current_node = @head 
      until current_node.next_node_pointer == nil 
        if data == current_node.data 
          return true 
        else 
          current_node = current_node.next_node_pointer 
        end 
      end 

      return false 
      
    else 
      return "Invalid Entry"
    end 
  end

  def pop 
    @head == nil ? (return "List is empty") : nil 

    if count <= 1  
      @head = nil

    else prior_node = @head 
    (count - 2).times do 
        prior_node = prior_node.next_node_pointer
      end  
      prior_node.next_node_pointer = nil
    end 
  end 
  
end
  