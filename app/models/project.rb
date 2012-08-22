class Project < ActiveRecord::Base
  has_many :tickets, :dependent => :delete_all
  attr_accessible :name, :description
  validates :name, :presence => true
end
