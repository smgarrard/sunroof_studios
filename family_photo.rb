class FamilyPhotoArranger
  attr_accessor :possible_arrangements
  attr_reader :n_persons

  def initialize(n_persons)
    @n_persons = n_persons
    generate_all_possible_permutations
    filter_permutations
    p possible_arrangements.count
  end

  def generate_all_possible_permutations
    self.possible_arrangements = (1..@n_persons).to_a.permutation.to_a #this needs drastic improvement
  end

  def filter_permutations
    self.possible_arrangements.reject! do |permutation|
      if the_left_end_of_the_row_does_not_have_the_1_year_old?(permutation)
        true #reject 
      elsif the_difference_in_ages_of_every_two_family_members_exceeds_2?(permutation)
        true #reject
      end
    end
  end

  def the_left_end_of_the_row_does_not_have_the_1_year_old? permutation
    permutation.first != 1
  end

  def the_difference_in_ages_of_every_two_family_members_exceeds_2? permutation
    permutation.each_cons(2) do |consecutive| 
      return true if (consecutive.first - consecutive.last).abs > 2 
    end
    false
  end
end

ARGV.each do |a|
  FamilyPhotoArranger.new(a.to_i) if a.to_i > 0 && a.to_i < 55 && a.respond_to?('to_i') == true
end