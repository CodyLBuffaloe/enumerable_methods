require "./lib/enumerable_methods.rb"
describe Enumerable do
  describe ".my_each" do
    context "given an array and block commanding puts" do
      it "executes the block using the array values" do
        arr = [1, 2, 3, 4, 10]
        expect(arr.my_each {|x| puts x}).to eql([1, 2, 3, 4, 10])
      end
    end
#Broken Test!! Must Fix!!
    context "given an array and block manipulating array" do
      it "executes the block and manipulation" do
        arr = [1]
        expect(arr.my_each {|x| x+2}).to eql(3)
      end

    end
  end
end