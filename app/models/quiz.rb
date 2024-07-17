class Quiz < ApplicationRecord
  attr_accessor :current_step
  
  validates :email, presence: true, uniqueness: { case_sensitive: false }, if: -> { current_step == 'email' }
  validates :weight, presence: true, numericality: { greater_than: 0 }, if: -> { current_step == 'weight' }
  validates :birthdate, presence: true, comparison: { less_than: Time.zone.today }, if: -> { current_step == 'birthdate' }
  
  def current_step
    @current_step ||= steps.first
  end
  
  def steps
    ['email', 'weight', 'birthdate']
  end
  
  def next_step
    self.current_step = steps[steps.index(current_step) + 1]
  end
  
  def previous_step
    self.current_step = steps[steps.index(current_step) - 1]
  end
  
  def first_step?
    current_step == steps.first
  end
  
  def last_step?
    current_step == steps.last
  end
  
  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end

  def get_step 
    # Get attr values in order

    attrs = attributes.slice('email','weight','birthdate').values_at *User.column_names
    attrs.compact_blank!
    self.steps[attrs.length]
  end
end
