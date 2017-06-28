require "./lib/enumerable_methods.rb"
describe Enumerable do
  describe ".my_each" do
    context "given an array and block commanding puts" do
      it "executes the block using the array values" do
        arr = [1, 2, 3, 4, 10]
        expect(arr.my_each {|x| puts x}).to eql([1, 2, 3, 4, 10])
      end
    end
    context "given an array and block manipulating array" do
      it "executes the block and manipulation" do
        arr = [1]
        expect(arr.my_each {|x| x+2}).to eql(arr.each{|x| x+2})
      end

    end
  end
  describe ".my_each_with_index" do
    context "given an array" do
      it "returns the correct count of indicies" do
        arr = [0, nil, "cat", {}]
        expect(arr.my_each_with_index {|n, i| puts "#{n}, #{i}"}).to eql(arr.each_with_index {|n, i| puts "#{n}, #{i}"})
      end
    end
  end
  describe ".my_select" do
    context "given block to select even num" do
      it "outputs only the even numbers" do
        arr = [1, 2, 3, 4, 5, 6]
        expect(arr.my_select{|x| x.even?}).to eql([2, 4, 6])
      end
    end
  end
  describe ".my_all?" do
    context "given false" do
      it "returns false" do
        arr = [true, true, false]
        expect(arr.my_all?).to eql(false)
      end
    end
    context "given only true input" do
      it "returns true" do
        arr = [1, 3, 5]
        expect(arr.my_all?{|x| x.odd?}).to eql(true)
      end
    end
    context "given nil input" do
      it "responds to nil appropriately" do
        arr = [true, "cat", 3, nil]
        expect(arr.my_all?).to eql(false)
      end
    end
  end
  describe ".my_any?" do
    context "given all true" do
      it "returns true" do
        arr = [2, 4, 6]
        expect(arr.my_any?{|x| x.even?}).to eql(true)
      end
    end
    context "given all false" do
      it "returns false" do
        arr = [2, 4, 6]
        expect(arr.my_any?{|x| x.odd?}).to eql(false)
      end
    end
    context "given all false and no block" do
      it "evaluates to false" do
        arr = [nil, false, nil]
        expect(arr.my_any?).to eql(false)
      end
    end
  end
  describe ".my_none?" do
    context "given all true" do
      it "returns false" do
        arr = [2, 4, 6]
        expect(arr.my_none?{|x| x.even?}).to eql(false)
      end
    end
    context "given all false" do
      it "returns true" do
        arr = [2, 4, 6]
        expect(arr.my_none?{|x| x.odd?}).to eql(true)
      end
    end
    context "given all false and no block" do
      it "returns true" do
        arr = [nil, false, nil]
        expect(arr.my_none?).to eql(true)
      end
    end
    context "given all 'true' and no block" do
      it "returns false" do
        arr = [0, "cat", {:canine => "Dog"}, true]
        expect(arr.my_none?).to eql(false)
      end
    end
  end
  describe "my_count" do
    context "given Array w/ 4 elements and no block" do
      it "returns 4 as count" do
        arr = [1, 2, 3, 4]
        expect(arr.my_count).to eql(4)
      end
    end
    context "given my_count(2)" do
      it "returns count of all 2s in Array" do
        arr = [1, 2, 3, 42, 25, 2, 3, 2, 4]
        expect(arr.my_count(2)).to eql(3)
      end
    end
    context "given a block and an Array" do
      it "returns count of elements that match block condition" do
        arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        expect(arr.my_count{|x| x%2 == 0}).to eql(5)
      end
      it "returns number of matching elements" do
        arr = [2, 4, 6, 8, 10]
        expect(arr.my_count{|x| x%2 != 0}).to eql(0)
      end
    end
  end
  describe ".my_map" do
    context "given block" do
      it "returns new array using block conditions" do
        arr = [1, 2, 3]
        expect(arr.map{|x| x*2}).to eql([2, 4, 6])
      end
    end
    context "given no block" do
        arr = [1, 2, 3]
        specify { expect(arr.my_map).to be}
    end
  end
end