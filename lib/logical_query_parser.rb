require 'treetop'
require 'logical_query'
require 'logical_query_parser/version'
require 'logical_query_parser/nodes/base'
require 'logical_query_parser/nodes/active_record' if defined? ActiveRecord::Base

class LogicalQueryParser < Treetop::Runtime::CompiledParser
  class << self
    def walk_tree(node, &block)
      yield node
      unless node.elements.nil?
        node.elements.each do |element|
          walk_tree(element, &block)
        end
      end
    end
  end
end
