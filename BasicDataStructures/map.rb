class Map
    private attr_reader :my_map
    def initialize
        @my_map = []
    end

    def set(key,value)
        idx = my_map.index{|pair| pair[0] == key}
        if idx
            my_map[idx][1] = value
        else
            my_map.push([key,value])
        end
        value
    end

    def get(key)
        my_map.each do |pair| 
            if pair[0] == key
                return pair[1]
            end
        end
        nil
    end

    def delete(key)
        my_map.each do |pair| 
            if pair[0] == key
                my_map.delete(pair)
            end
        end
    end

    def show
        my_map.map do |ele|
            if ele.is_a?(Array)
                ele
            end
        end
    end
end
