module Enumerable

    def my_each(&block)

        i = 0

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

       self.my_each do |element|

            yield(element)

       end

        self

    end


end