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

    xit "can move to the next node" do
        node = Node.new("ts")
        expect(node.next_node).to eq(nil) 
    end 

end 