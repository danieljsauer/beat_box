class Node 

    attr_reader :data
    attr_accessor :next_node 

    def initialize(data)
        @data = data
        @next_node = nil  
        #next_node is nil since nil is what indicates the tail of the linked list. Unless we specify, we will be adding nodes to the back of the train.
    end 

end 