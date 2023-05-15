require 'rspec'
require 'pry'
require './lib/beat_box'
require './lib/node'
require './lib/linked_list'

describe BeatBox do 
  describe "initialize" do
    it "exists" do
      bbox = BeatBox.new
      expect(bbox).to be_instance_of(BeatBox)  
    end 
    it "creates a list object" do
      bbox = BeatBox.new
      expect(bbox.list).to be_instance_of(LinkedList)
    end 
  end 

  describe "LinkedList methods" do 

    describe "count" do 
      it "counts the number of node" do 
        bbox = BeatBox.new
        bbox.list.append("bts")
        bbox.list.append("pts")
        bbox.list.append("kuh")
        expect(bbox.count).to eq(3)
      end 
    end 

    describe "append" do 
      xit "splits multiple words into seperate nodes" do 
        bbox = BeatBox.new
        bbox.append("bts pts kuh ts")
        expect(bbox.list.to_string).to eq ("bts pts kuh ts")
        expect(bbox.count).to eq("4")
      end 
    end

    describe "prepend" do 
      xit "adds the first word as the first node" do 
        bbox = BeatBox.new
        bbox.append("ts")
        bbox.prepend("bts pts kuh")
        expect(bbox.list.to_string).to eq ("bts pts kuh ts")
        expect(bbox.count).to eq("4")
      end 
    end 

  end 

end 