class LinkedList 

    attr_reader :head

    def initialize
        @head = nil 
    end

    def append(data)
        new_node = Node.new(data)
        @head == nil ? @head = new_node : nil
        new_node  
    end 
end 