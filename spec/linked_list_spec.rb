require 'rspec'
require './lib/node'
require './lib/linked_list'

describe LinkedList do
  describe "Initialize" do
    it "exists" do
        list = LinkedList.new
        expect(list).to be_instance_of(LinkedList)
    end 

    it "has a head with a default value of nil" do 
        list = LinkedList.new
        expect(list.head).to eq(nil)
    end 
  end

  describe "append method" do 
    it "creates a new node instance" do 
        list = LinkedList.new
        tnode = list.append("bts")
        expect(tnode).to be_instance_of(Node)
    end 

    it "can pass data into current node" do
        list = LinkedList.new
        tnode = list.append("bts")
        expect(tnode.data).to eq("bts")
    end

    it "sets first node as head" do
        list = LinkedList.new
        list.append("bts")
        expect(list.head.data).to eq("bts")
    end

    it "head points towards nil " do
        list = LinkedList.new
        list.append("bts")
        expect(list.head.next_node_pointer).to eq(nil)
    end 

    it "moves to the next node" do
        list = LinkedList.new
        list.append("bts")
        list.append("kuh")
        expect(list.head.next_node_pointer.next_node_pointer).to eq(nil)
    end

    it "adds nodes in the correct order" do
        list = LinkedList.new
        list.append("bts")
        list.append("kuh")
        expect(list.head.next_node_pointer.data).to eq("kuh")
    end
        
  end 
        
  describe "other instance methods" do 

    it "count: count begins at 0" do
        list = LinkedList.new
        expect(list.count).to eq(0)
    end

    it "count: counter is set to 1 by default if @head != nil" do
        list = LinkedList.new
        list.append("bts")
        expect(list.count).to eq(1)
    end

    it "count: counts the number of nodes in the list" do
        list = LinkedList.new
        list.append("bts")
        list.append("ts")
        list.append("kuh")
        list.append("bts")
        expect(list.count).to eq(4)
    end

    xit "to_string: prints the current data of all nodes as a string" do 
        list = LinkedList.new
        list.appened("bts")
        expect(list.to_string).to eq("bts") 
    end 
  end 
end 
