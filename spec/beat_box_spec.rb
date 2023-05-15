require 'rspec'
require 'pry'
require './lib/beat_box'
require './lib/node'
require './lib/linked_list'

describe BeatBox
  describe "initialize" do
    xit "exists" do
      bbox = BeatBox.new
      expect(bbox).to be_instance_of(BeatBox)  
    end 
    xit "creates a list object" do
      bbox = BeatBox.new
      expect(bbox.list).to be_instance_of(LinkedList)
    end 

  end 

end 