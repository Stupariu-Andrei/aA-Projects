module Searchable
    def dfs(target = nil, &prc)
        raise "Need a prc or a target" if [target, prc].none?
        prc ||= Proc.new{|node| node.value == target}

        return self if prc.call(self)

        children.each do |child|
            result = child.dfs(&prc)
            return result unless result.nil?
        end

        nil
    end

    def bfs(target = nil, &prc)
        raise "Need a prc or a target" if [target, prc].none?
        prc ||= Proc.new{|node| node.value == target}
        nodes = [self]
        while !nodes.empty?
            node = nodes.shift
            return node if prc.call(node)
            nodes.concat(node.children)
        end
        
        nil
    end
end


class PolyTreeNode
    include Searchable
    
    attr_reader :parent
    attr_accessor :value
    def initialize(value)
        @value = value
        @parent = nil
        @children =[]
    end

    def children
        @children.dup
    end

    def _children
        @children
    end

    def parent=(parent)
        return if self.parent == parent
        if self.parent
            self.parent._children.delete(self)
        end
        @parent = parent
        self.parent._children << self unless self.parent.nil?
    end

    def add_child(child)
        child.parent = self
    end 

    def remove_child(child)
        if child.parent.nil?
            raise "not a child"
        else
            child.parent = nil
        end
    end

end

