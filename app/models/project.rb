class Project < ActiveRecord::Base
  acts_as_paranoid

  has_many :items, :dependent => :destroy

  validates :title,
    :presence => true,
    :uniqueness => true
end
