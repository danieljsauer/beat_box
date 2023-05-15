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
      it "counts the number of nodes" do 
        bbox = BeatBox.new
        bbox.list.append("bts")
        bbox.list.append("pts")
        bbox.list.append("kuh")
        expect(bbox.count).to eq(3)
      end 
    end 

    describe "append" do 
      it "splits multiple words into seperate nodes" do 
        bbox = BeatBox.new
        bbox.append("bts pts kuh ts")
        expect(bbox.list.to_string).to eq ("bts pts kuh ts")
        expect(bbox.count).to eq(4)
      end 
      it "skips words that contain too many characters" do
        bbox = BeatBox.new
        bbox.append("bts kuh 0123456789012 tsh")
        expect(bbox.list.to_string).to eq("bts kuh tsh")
        expect(bbox.count).to eq(3)
      end 
      it "only accepts string data" do 
        bbox = BeatBox.new
        expect(bbox.append(42)).to eq("Invalid Entry")
      end
    end

    describe "prepend" do 
      it "adds the first word as the first node" do 
        bbox = BeatBox.new
        bbox.append("ts")
        bbox.prepend("bts pts kuh")
        expect(bbox.list.to_string).to eq ("bts pts kuh ts")
        expect(bbox.count).to eq(4)
      end 
      it "skips words that contain too many characters" do
        bbox = BeatBox.new
        bbox.prepend("bts kuh 0123456789012 tsh")
        expect(bbox.list.to_string).to eq("bts kuh tsh")
        expect(bbox.count).to eq(3)
      end 
      it "only accepts string data" do 
        bbox = BeatBox.new
        expect(bbox.prepend(42)).to eq("Invalid Entry")
      end
    end 

  end 

end 