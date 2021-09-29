class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    self.auditions.select(:actor)
  end

  def locations
    self.auditions.select(:location)
  end

  def lead
    self.auditions.find_by(hired: true) ? self.auditions.find_by(hired: true) : 'no actor has been hired for this role'
  end

  def understudy
    self.auditions.where(hired: true)[1] ? self.auditions.where(hired: true)[1] : 'no actor has been hired for understudy for this role'
  end

end