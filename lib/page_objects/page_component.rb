require 'spec_helper'
require 'capybara'

class PageComponent < Capybara::Node::Element

  ##
  # Models a UI Component as a tree where each node is in turn a PageComponent.
  # The child nodes of a PageComponent are sub-elements of the corresponding UI elements in the UI, thus,
  # maintain the parent-child relationship in the DOM.
  # This is achieved by using Capybara's Capybara::Node::Element.find() method which looks for sub-elements
  # within an element.

  include Capybara::DSL

  # :element = Capybara::Node::Element wrapped in the PageComponent
  # :sub_elements = A Hash of PageComponents which are the children of the UI element represented by this object
  # :parent = Reference to the parent PageComponent
  # :locator = A :css or :xpath locator as understood by Capybara::Node::Element

  attr_accessor :element, :sub_elements, :parent, :locator

  def initialize(locator, sub_elements=nil, parent=nil)
    @locator = locator
    if parent
      raise "Not a Page Component" if !parent.is_a? PageComponent
      @parent = parent
    end
    @sub_elements = sub_elements || {}
  end

  def [](key)
    @sub_elements[key]
  end

  def each
    current_index = 0
    while self[current_index] != nil
      yield self[current_index]
      current_index += 1
    end
  end

  def f
    if @parent
      locator_chain = @locator
      parent_node = @parent
      while parent_node
        locator_chain = parent_node.locator + " " + locator_chain
        parent_node = parent_node.parent
      end
      find(locator_chain)
    else
      find(@locator)
    end
  end

  def []=(key, value)
    _set_sub_element(key, value)
  end

  def sub_elements=(sub_elements)
    sub_elements.each do |key, value|
      _set_sub_element(key, value)
    end
  end

  def contains(child_key)
    self.f.all(self[child_key].locator).size > 0
  end

  def _set_sub_element(key, value)
    if value.is_a? String
      @sub_elements[key] = PageComponent.new(value,nil,self)
    elsif value.is_a? PageComponent
      value.parent = self
      @sub_elements[key] = value
    else
      @sub_elements[key] = value
    end
  end

end