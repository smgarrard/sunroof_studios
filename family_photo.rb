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
    self.possible_arrangements = (1..@n_persons).to_a.permutation.to_a
  end

  def filter_permutations
    self.possible_arrangements.reject! do |permutation|
      if check_left_end_of_the_row_has_the_1_year_old permutation
        true #reject 
      elsif check_differences_in_ages_of_every_two_family_members_does_not_exceed_2 permutation
        true #reject
      end
    end
  end

  def check_left_end_of_the_row_has_the_1_year_old permutation
    permutation.first != 1
  end

  def check_differences_in_ages_of_every_two_family_members_does_not_exceed_2 permutation
    permutation.each_cons(2) do |consecutive| 
      return true if (consecutive.first - consecutive.last).abs > 2
    end
    false
  end
end

ARGV.each do |a|
  FamilyPhotoArranger.new(a.to_i) if a.to_i > 0 && a.to_i < 55 && a.respond_to?('to_i') == true
end