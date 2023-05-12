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
  end
  

        # count idea : 
        # loop current node like in append. 
        # nodes 
        # nodes +1 and return that number  