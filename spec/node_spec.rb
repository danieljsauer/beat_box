require 'rspec'
require './lib/node'

describe Node do
  it "exists" do
    node = Node.new("ts")
    expect(node).to be_instance_of(Node)
  end 

  it "can hold data" do 
    node = Node.new("ts")
    expect(node.data).to eq("ts")
  end 

  it "next_node_pointer default value is nil" do
    node = Node.new("ts")
    expect(node.next_node_pointer).to eq(nil) 
  end 
end 