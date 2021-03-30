class Queue
    def initialize
        @queue_arr = []
    end

    def enqueue(el)
        @queue_arr.push(el)
    end

    def dequeue
        @queue_arr.shift
    end

    def peek
        @queue_arr.first
    end
end

qu = Queue.new
qu.enqueue(1)
qu.enqueue(3)
qu.enqueue(4)
qu.dequeue
p qu.peek