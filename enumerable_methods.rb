module Enumerable

    def my_each(&block)
        i = 0

        while(i < self.size )# use a for loop when incrementing a subscript
            yield(self[i])
            i += 1
        end

        self
    end

    def my_each_with_index(&block)
        index = 0

        while(index < self.size)
            yield(self[index], index)
            index += 1
        end

        self
    end

    def my_select(&block) #returns all true els from a set
        all_true_els = []

       self.my_each do |element|
            return enum_for(:my_select) unless block_given?
            this_el = yield(element)
            if (this_el == true)
                all_true_els << element
            end
       end

        return all_true_els
    end

    def my_all?(&block) # Do all els match block criteria
        are_all_true = false
        if block_given?
            self.my_each do |element|
                are_all_true = yield(element)
                if (are_all_true == false)
                    return are_all_true
                    break
                end
            end
        else
            self.my_each do |element|
                if(element == false || element == nil)
                    are_all_true = false
                    break
                else
                    are_all_true = true
                end
            end
        end
        return are_all_true
    end

    def my_any?(&block) # As long as not all els are false, will return true
        are_any_true = false
        if block_given?
            self.my_each do |element|

                 are_any_true = yield(element)
                 if(are_any_true == true)
                        are_any_true = true
                        break
                 end
            end
        else
            self.my_each do |element|
                if(element == true)
                    are_any_true = true
                end
            end
        end
        return are_any_true
    end

    def my_none?(&block) #Do none of the elements match the block criteria
        are_all_false = true
        if block_given?

            self.my_each do |element|
                is_el_true = yield(element)
                if(is_el_true == true)
                    are_all_false = false
                    break
                end
            end
        else
            self.my_each do |element|
                if(element == true)
                    are_all_false = false
                    break
                end
            end
        end
        return are_all_false
    end

    def my_count(is_item_present = nil)
        num_of_els = 0

        if block_given?
            self.my_each do |element|
                is_it_true = yield(element)
                if(is_it_true == true)
                    num_of_els+=1
                end

            end
        elsif(!block_given?)||(is_item_present)
            if(is_item_present)
                self.my_each do |element|
                    if(is_item_present == element)
                        num_of_els+=1
                    end
                end
            else
                self.my_each do |element|
                    num_of_els+=1
                end
            end
        end
        return num_of_els
    end

    def my_map
        mapped_array = []
        if block_given?
            self.my_each do |element|
                mapped_array<< yield(element)
            end
            return mapped_array
        else
           return enum_for(:my_map)
        end
    end


end