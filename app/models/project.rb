class Project < ActiveRecord::Base
  has_many :items, :dependent => :destroy
  validates :title,
    :presence => true,
    :uniqueness => true
end
