class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    self.auditions.map(&:actor)
  end

  def locations
    self.auditions.map(&:location)
  end

  def lead
    hired_true = self.auditions.find_by(hired: true)
    hired_true ? hired_true : 'no actor has been hired for this role'
  end

  def understudy
    understudy_true = self.auditions.where(hired: true)[1]
    understudy_true ? understudy_true : 'no actor has been hired for understudy for this role'
  end

end