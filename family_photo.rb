
class FamilyPhotoArrangement
  attr_accessor :array_of_family_members

  def initialize(n_persons)
    self.array_of_family_members = (1..n_persons).to_a
  end

  def difference_in_ages

  end

  def generate_all_combinations_of_family_members
    array_of_family_members.shift
    [1].product(array_of_family_members)
  end

end
