require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'
require './lib/patron'

class PatronTest < Minitest::Test

  def test_it_exists
    patron = Patron.new("Bob", 20)

    assert_instance_of Patron, patron
  end
end 
