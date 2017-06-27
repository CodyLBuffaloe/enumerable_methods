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
end