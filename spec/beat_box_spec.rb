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
    it "default data value is nil" do 
      bbox = BeatBox.new
      expect(bbox.data).to eq(nil)
    end 
    it "can pass through data" do 
      bbox = BeatBox.new("plin plin plon")
      expect(bbox.list.to_string).to eq ("plin plin plon")
      expect(bbox.count).to eq (3) 
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

  describe "play method and related voice methods" do 
    xit "collects data as a string" do 
      bbox = BeatBox.new
      bbox.append("this is a string test")
      expect(bbox.play).to eq("this is a string test")
      expect(bbox.count).to eq(5)
      #passes the ear check 
    end
    xit "can change voice" do 
      bbox = BeatBox.new
      bbox.append("this is a voice change test")
      bbox.play
      bbox.voice = "Rishi"
      bbox.play 
      expect(bbox.voice).to eq("Rishi")
      #ear check
    end 
    xit "can change speech speed" do 
      bbox = BeatBox.new
      bbox.append("this is a rate speed test")
      bbox.play 
      bbox.rate = 500
      bbox.play 
      expect(bbox.rate).to eq(500)
      #ear check
    end 
    xit "can reset say voice" do
      bbox = BeatBox.new
      bbox.append("this is a voice reset method test")
      bbox.play
      bbox.voice = "Rishi"
      bbox.play
      bbox.reset_voice
      bbox.play
      expect(bbox.voice).to eq("Daniel")
      #ear check
    end 
    xit "can reset say speed" do 
      bbox = BeatBox.new
      bbox.append("this is a rate reset method test")
      bbox.play
      bbox.rate = 500  
      bbox.play
      bbox.reset_rate
      bbox.play
      expect(bbox.rate).to eq(250)
      #ear check
    end 
    xit "can lay down a serious beat" do 
      bbox = BeatBox.new
      bbox.append("sh sh klack sh sh klack sh h klack boots kicks")
      expect(bbox.play).to eq("sh sh klack sh sh klack sh h klack boots kicks")
      #ear check 
      bbox.play 
    end 
  end 
end 

 