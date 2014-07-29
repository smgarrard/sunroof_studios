
require_relative "family_photo"
require "test/unit"
system("clear") # for clean output

class TestFamilyPhotoArrangement < Test::Unit::TestCase
  
  def setup
    @n_persons = 4
    @family_arrangement = FamilyPhotoArrangement.new(@n_persons)
  end

  def test_array_of_family_members
    array = (1..@n_persons).to_a
    assert_equal(array, @family_arrangement.array_of_family_members)
  end

  def test_the_1_year_old_member_is_at_the_left_end_of_the_row
    assert_equal( 1, @family_arrangement.array_of_family_members.first)
  end

  def test_difference_in_ages_does_not_exceed_2_years
    a = [1,2,3,4] 
    b = [1,2,4,3] 
    c = [1,3,2,4] 
    d = [1,3,4,2]

    # assert_equal( true, @family_arrangement.difference_in_ages)
    p @family_arrangement.generate_all_combinations_of_family_members
  end

end