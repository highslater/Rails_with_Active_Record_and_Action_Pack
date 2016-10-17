class Profile < ActiveRecord::Base
  belongs_to :user
  validates :gender, inclusion: {in: %w(male female)}
  validate :both_not_nil
  validate :boy_named_Sue

  def self.get_all_profiles(min_year, max_year)
    # SELECT "profiles".* FROM "profiles" WHERE (birth_year: BETWEEN 1960 AND 1985)
    Profile.where("birth_year BETWEEN ? AND ?", min_year, max_year).order_by_asc_birth_year
  end

  def both_not_nil
    if first_name.nil? and last_name.nil?
      errors.add(:base, "nope")
    end
  end

  def boy_named_Sue
    if gender == "male" and first_name == "Sue"
      errors.add(:gender, "boy cannot be named Sue")
    end
  end
  scope :order_by_asc_birth_year, -> {order birth_year: :asc} #{order(birth_year: 'asc')}
end
