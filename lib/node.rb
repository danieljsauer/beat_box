class Node 

    attr_reader :data
    attr_accessor :next_node_pointer 
    #I am using accessor for next_node because the linked_list will be altering this data, but I need it to be stored within the node. Unsure if this is the correct appraoch.

    def initialize(data)
        @data = data
        @next_node_pointer = nil  
        #next_node is nil since nil is what indicates the tail of the linked list. Unless we specify, we will be adding nodes to the back of the train.
        #next node is how we will move around the list. This attribute is VERY confusing to me. 
    end 

end 