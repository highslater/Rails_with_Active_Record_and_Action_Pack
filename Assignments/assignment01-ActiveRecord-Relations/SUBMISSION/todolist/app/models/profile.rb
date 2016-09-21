class Profile < ActiveRecord::Base
  belongs_to :user
  validates :gender, inclusion: {in: %w(male female)}
  validate :no_boy_named_Sue
  validate :first_last_nil

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

end
