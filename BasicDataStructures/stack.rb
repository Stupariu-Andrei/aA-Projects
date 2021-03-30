class Stack
    def initialize
        @stack_array = []
      end
  
      def push(el)
        @stack_array.push(el)
      end
  
      def pop
        @stack_array.pop
      end
  
      def peek
        @stack_array.last
      end

end

stack = Stack.new
stack.push(1)
stack.push(2)
p stack
p stack.peek