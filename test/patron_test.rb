require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'
require './lib/patron'

class PatronTest < Minitest::Test
  def setup
    @patron = Patron.new("Bob", 20)
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")
  end

  def test_it_exists_with_readable_attributes
    patron = Patron.new("Bob", 20)

    assert_instance_of Patron, patron
    assert_equal "Bob", patron.name
    assert_equal 20, patron.spending_money
    assert_empty patron.interests
  end

  def test_it_can_add_interests

    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], @patron_1.interests
  end
end
