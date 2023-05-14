require 'rspec'
require 'pry'
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

    it "data can only be a string" do
        list = LinkedList.new
        expect(list.append(42)).to eq ("Invalid Entry")
        expect(list.count).to eq (0)
    end 

    it "data can only be 10 characters or fewer" do
        list = LinkedList.new
        expect(list.append("12345678901")).to eq ("Invalid Entry")
        expect(list.count).to eq (0)
        list.append("1234567890")
        expect(list.head.data).to eq ("1234567890")
        expect(list.count).to eq (1)
    end 
        
  end 
        
  describe "other instance methods" do 
    describe"count" do
        it "count begins at 0" do
            list = LinkedList.new
            expect(list.count).to eq(0)
        end

        it "counter is set to 1 by default if @head != nil" do
            list = LinkedList.new
            list.append("bts")
            expect(list.count).to eq(1)
        end

        it "counts the number of nodes in the list" do
            list = LinkedList.new
            list.append("bts")
            list.append("ts")
            list.append("kuh")
            list.append("bts")
            expect(list.count).to eq(4)
        end
    end 
    describe "to_string" do
        it "has a default return if no items are in the list" do 
            list = LinkedList.new
            expect(list.to_string).to eq("No items in list") 
        end 

        it "prints the data of the head node as a string" do 
            list = LinkedList.new
            list.append("bts")
            expect(list.to_string).to eq("bts") 
        end 

        it "prints the data of all node in the list, seperated by a space" do 
            list = LinkedList.new
            list.append("bts")
            list.append("ts")
            list.append("kuh")
            list.append("bts")
            expect(list.to_string).to eq("bts ts kuh bts") 
        end 
    end
    describe "prepend" do
        it "can add items into the list" do
            list = LinkedList.new
            list.prepend("ts")
            expect(list.head.data).to eq("ts")
            expect(list.head.next_node_pointer).to be nil 
        end
        it "becomes the head node" do
            list = LinkedList.new
            list.append("bts")
            list.prepend("ts")
            expect(list.head.data).to eq("ts")
        end
        it "points towards the old head node if replacing head" do
            list = LinkedList.new
            list.append("bts")
            list.prepend("ts")
            expect(list.head.next_node_pointer.data).to eq("bts")
            expect(list.head.next_node_pointer.next_node_pointer).to be nil 
        end
        it "old head node points towards the next node in list" do
            list = LinkedList.new
            list.append("bts")
            list.prepend("ts")
            list.append("kuh")
            expect(list.head.next_node_pointer.next_node_pointer.data).to eq("kuh")
            expect(list.head.next_node_pointer.next_node_pointer.next_node_pointer).to be nil 
        end
        it "connects all nodes together properly" do
            list = LinkedList.new
            list.append("bts")
            list.append("ts")
            list.prepend("kuh")
            list.append("bts")
            expect(list.to_string).to eq("kuh bts ts bts") 
        end  
        it "only accepts string data"do
            list = LinkedList.new
            expect(list.append(42)).to eq ("Invalid Entry")
        end 
        it "data can only be 10 characters or fewer" do
            list = LinkedList.new
            expect(list.prepend("12345678901")).to eq ("Invalid Entry")
            expect(list.count).to eq (0)
            list.prepend("1234567890")
            expect(list.head.data).to eq ("1234567890")
            expect(list.count).to eq (1)
        end 
    end 
    describe "insert" do
        it "places the new node in the correct position" do
            list = LinkedList.new
            list.append("bts")
            list.append("ts")
            list.insert(1, "kuh")
            expect(list.head.next_node_pointer.data).to eq("kuh")
        end
        it "inserted node correctly points to next item on list" do
            list = LinkedList.new
            list.append("bts")
            list.append("ts")
            list.insert(1, "kuh")
            expect(list.head.next_node_pointer.next_node_pointer.next_node_pointer).to be nil 
        end 
        it "sets the head node if index position == 0" do
            list = LinkedList.new
            list.append("bts")
            list.append("ts")
            list.insert(0, "kuh")
            expect(list.head.data).to eq("kuh")
            expect(list.head.next_node_pointer.next_node_pointer.next_node_pointer).to be nil 
        end
        it "only accepts string data"do
            list = LinkedList.new
            expect(list.insert(0,42)).to eq("Invalid Entry")
        end 
        it "data can only be 10 characters or fewer" do
            list = LinkedList.new
            expect(list.insert(0, "12345678901")).to eq ("Invalid Entry")
            expect(list.count).to eq (0)
            list.insert(0, "1234567890")
            expect(list.head.data).to eq("1234567890")
            expect(list.count).to eq (1)
        end 
        it "index only accepts integers"do
            list = LinkedList.new
            expect(list.insert("ts","ts")).to eq("Invalid Entry")
        end 
        it "index cannot be greater than list length" do
            list = LinkedList.new
            expect(list.insert(1,"kuh")).to eq("Invalid Entry")
            list.insert(1,"kuh")
            expect(list.count).to eq (0)
        end 
    end  
    describe "find" do 
        xit "gives notice that list is empty if called upon empty list" do 
            list = LinkedList.new
            expect(list.find(0,1)).to eq("List is empty")
        end 
        xit "only accepts integers as arguments" do
            list = LinkedList.new
            list.append("bts")
            expect(list.find("bts",1)).to eq("Invalid Entry")
            expect(list.find(0,"bts")).to eq("Invalid Entry")
        end 
        xit "returns the data from the selected node" do
            list = LinkedList.new
            list.append("bts")
            list.append("kuh")
            expect(list.find(1,1)).to eq("kuh")
        end 
        xit "can return multiple nodes of data in a string" do
            list = LinkedList.new
            list.append("bts")
            list.append("kuh")
            list.append("pttz")
            list.append("ts")
            expect(list.find(1,3)).to eq("kuh pttz ts")
        end 
        xit "does not print nil if the number argument exceeds the list length" do 
            list = LinkedList.new
            list.append("bts")
            list.append("kuh")
            expect(list.find(1,2)).to eq ("kuh")
        end 
    end 
    describe "includes?" do 
    end 
    describe "pop" do 
    end 
  end 
end 
