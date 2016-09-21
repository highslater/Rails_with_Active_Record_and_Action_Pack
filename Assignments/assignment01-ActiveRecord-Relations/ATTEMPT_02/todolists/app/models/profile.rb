class Profile < ActiveRecord::Base
  belongs_to :user
  validates :gender, inclusion: {in: %w(male female), message: "%{value} is not a valid gender"}
  validate :boy_named_sue
  validate :nil_name

  def boy_named_sue
    if gender == "male" and first_name == "Sue"
      errors.add(:first_name, "Boy cant be named Sue")
    end
  end

  def nil_name
    if (first_name.nil? and last_name.nil?)
      errors[:base] << ("Must have a first or last name")
    end
  end

end
