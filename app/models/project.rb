class Project < ActiveRecord::Base
  has_many :tickets, :dependent => :delete_all
  attr_accessible :name, :description
  validates :name, :presence => true, :uniqueness => true
  has_many :permissions, :as => :thing 
  def self.viewable_by(user)
    joins(:permissions).where(:permissions => { :action => "view",
                                              :user_id => user.id })
  end


  def self.for(user)
    user.admin? ? Project : Project.viewable_by(user)
  end
  
end
