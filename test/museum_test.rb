require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'
require './lib/patron'
require './lib/museum'

class MuseumTest < Minitest::Test

  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
    @patron_1 = Patron.new("Bob", 20)
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")

    @patron_2a = Patron.new("Sally", 20)
    @patron_2a.add_interest("IMAX")

    @patron_2 = Patron.new("Sally", 20)
    @patron_2.add_interest("Dead Sea Scrolls")
    @patron_3 = Patron.new("Johnny", 5)
    @patron_3.add_interest("Dead Sea Scrolls")
  end

  def test_it_exists

    assert_instance_of Museum, @dmns
  end

  def test_it_has_readable_attributes

    assert_equal "Denver Museum of Nature and Science", @dmns.name
    assert_empty @dmns.exhibits
    assert_empty @dmns.patrons
  end

  def test_add_exbits

    assert_empty @dmns.exhibits

    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)

    assert_equal [@gems_and_minerals, @dead_sea_scrolls, @imax], @dmns.exhibits
  end

  def test_exhibit_match
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)

    assert_equal ["Gems and Minerals"], @dmns.exhibit_match(@gems_and_minerals, @patron_1)
  end


  def test_recommend_exhibits

    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)

    assert_equal [@imax], @dmns.recommend_exhibits(@patron_2a)
    assert_equal [@gems_and_minerals, @dead_sea_scrolls], @dmns.recommend_exhibits(@patron_1)
  end

  def test_it_can_admit_and_track_patrons
    @dmns.admit(@patron_1)
    @dmns.admit(@patron_2)
    @dmns.admit(@patron_3)

    assert_equal [@patron_1, @patron_2, @patron_3], @dmns.patrons
  end

  def test_patrons_by_exhibit_interest
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.admit(@patron_1)
    @dmns.admit(@patron_2)
    @dmns.admit(@patron_3)
    expected_1 = [@patron_1]
    expected = {
              @gems_and_minerals => [@patron_1],
              @dead_sea_scrolls => [@patron_1, @patron_2, @patron_3]
    }

    assert_equal expected_1, @dmns.patron_array
    assert_equal expected, @dmns.patrons_by_exhibit_interest
  end
end
