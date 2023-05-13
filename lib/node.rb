class Node
  attr_reader :data
  attr_accessor :next_node_pointer

  def initialize(data)
    @data = data
    @next_node_pointer = nil
  end
end
