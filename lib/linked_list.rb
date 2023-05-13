class LinkedList
  attr_reader :head
  
  def initialize
    @head = nil
  end
  
  def append(data)
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
end
  