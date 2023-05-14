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
      items << head.data 
      current_node = @head 
      until current_node.next_node_pointer == nil 
        current_node = current_node.next_node_pointer
        items << current_node.data 
      end
    end
    items = items.join(" ")
    return items
  end  
end
  