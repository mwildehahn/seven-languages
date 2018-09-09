sixteen = *(0..15)
slice = []
sixteen.each do |num|
    slice << num
    if slice.count == 4
        puts "slice of 4: #{slice}"
        slice = []
    end
end

puts
sixteen.each_slice(4) { |slice| puts "slice of 4: #{slice}" }

puts

class Tree
    attr_accessor :children, :name

    def initialize(root)
        root.each do |name, children|
            @name = name
            @children = []
            children.each do |name, children|
                @children << Tree.new({ name => children })
            end
        end
    end

    def visit_all(&block)
        visit &block
        children.each { |c| c.visit_all &block }
    end

    def visit(&block)
        block.call self
    end
end

tree = Tree.new({ 'grandpa' => { 'dad' => { 'child 1' => {}, 'child 2' => {}}, 'uncle' => {'child 3' => {}, 'child 4' => {}}}});

puts 'Visit a node'
tree.visit { |node| puts node.name }
puts
puts 'Visiting entire tree'
tree.visit_all { |node| puts node.name }

def grep(regex, filename)
    regexp = Regexp.new(regex)
    File.open(filename, 'r') do |f|
        f.each_line.with_index do |line, index|
            puts "#{index} - #{line}" if regexp.match(line)
        end
    end
end

puts
grep 'Tree', 'tree.rb'