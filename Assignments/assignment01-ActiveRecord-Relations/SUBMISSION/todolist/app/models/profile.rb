
class Profile < ActiveRecord::Base
  belongs_to :user
  validate :first_last_nil
  validates :gender, inclusion: {in: %w(male female)}
  validate :no_boy_named_Sue

  def self.get_all_profiles(min_year, max_year)
    # puts "will return a list of profiles between #{min_year} and #{max_year} in ascending order"
    #  Profile.where("birth_year BETWEEN ? AND ?", min_year, max_year).all.each{|a| puts a.birth_year}
    # Profile.where("birth_year BETWEEN ? AND ?", min_year, max_year).ordered_by_birth_year.all.each{|a| puts a.birth_year}
    Profile.where("birth_year BETWEEN ? AND ?", min_year, max_year).ordered_by_birth_year
  end

  def first_last_nil
    if first_name.nil? and last_name.nil?
      errors.add(:base, 'first and last cannot both be nil')
    end
  end

  def no_boy_named_Sue
    if gender == "male" and first_name == "Sue"
      errors.add(:gender, 'A boy cannot be named "Sue"')
    end
  end

  scope :ordered_by_birth_year, -> {order birth_year: :asc}

end
