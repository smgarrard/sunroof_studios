require_relative "family_photo"
require "test/unit"
system("clear") # for easier to read console output

class TestFamilyPhotoArranger < Test::Unit::TestCase
  
  def setup
    puts "\n\n"
  end

  def teardown
    puts "\n"
  end

  def test_when_n_equals_3
    a = [1,2,3] 
    b = [1,3,2] 
    arry = [a,b]
    n_persons = 3
    family_arrangement = FamilyPhotoArranger.new(n_persons)
    family_arrangement.possible_arrangements.count

    assert_equal( arry, family_arrangement.possible_arrangements)
  end

  def test_when_n_equals_4
    a = [1,2,3,4] 
    b = [1,2,4,3] 
    c = [1,3,2,4] 
    d = [1,3,4,2]
    arry = [a,b,c,d]
    n_persons = 4
    family_arrangement = FamilyPhotoArranger.new(n_persons)
    family_arrangement.possible_arrangements.count

    assert_equal( arry, family_arrangement.possible_arrangements)
  end

  def test_when_n_equals_5
    a = [1,2,3,4,5] 
    b = [1,2,3,5,4] 
    c = [1,2,4,3,5] 
    d = [1,2,4,5,3]
    e = [1,3,2,4,5]
    f = [1,3,5,4,2]
    arry = [a,b,c,d,e,f]
    n_persons = 5
    family_arrangement = FamilyPhotoArranger.new(n_persons)
    family_arrangement.possible_arrangements.count

    assert_equal( arry, family_arrangement.possible_arrangements)
  end

  def test_when_n_equals_6
    n_persons = 6
    family_arrangement = FamilyPhotoArranger.new(n_persons)
    family_arrangement.possible_arrangements.count
  end

  def test_when_n_equals_7
    n_persons = 7
    family_arrangement = FamilyPhotoArranger.new(n_persons)
    family_arrangement.possible_arrangements.count
  end

end
