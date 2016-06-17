module Enumerable

    def my_each(&block)

        i = 0
# use a for loop when incrementing a subscript
        while(i < self.size )

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

    def my_select(&block)
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

    def my_all?(&block)

        are_all_true = false

            self.my_each do |element|

                if block_given?

                    are_all_true = yield(element)

                    if (are_all_true == false)
                        return are_all_true
                        break
                    end
                else
                    self.my_each do |element| element
                        are_all_true = true
                    end
                end

            end
        return are_all_true
    end


end