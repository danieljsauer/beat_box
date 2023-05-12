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

    describe "Instance methods" do 
        it "append: can pass data into current node" do
            list = LinkedList.new
            list.appened("bts")
            expect(new_node.data).to eq("bts")
        end
        it "appened: moves to the next node" do
            list = LinkedList.new
            list.appened("bts")
            expect(list.head.next_node).to eq(nil)
        end 

        it "count: counts the number of nodes in the list" do
            list = LinkedList.new
            list.appened("bts")
            expect(list.count).to eq(1)
        end

        it "to_string: prints the current data of all nodes as a string" do 
            list = LinkedList.new
            list.appened("bts")
            expect(list.to_string).to eq("bts") 
        end 
    end 
end 