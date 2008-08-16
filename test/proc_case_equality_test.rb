require File.join(File.dirname(__FILE__), '/test_helper')
require 'tidbits/core_extensions/proc/case_equality'
  
class ProcCaseEqualityTest < Test::Unit::TestCase #:nodoc: all
  
  attr_reader :equals_8, :is_not_a_string
  
  def setup
    @equals_8 = lambda { |x| x == 8 }
    @is_not_a_string = lambda { |x| !x.kind_of?(String) }
  end
  
  def test_case_equality
    assert   equals_8 === 8
    assert !(equals_8 === 7)
    
    assert is_not_a_string === :a
    assert !(is_not_a_string === 'foo')
  end
  
end