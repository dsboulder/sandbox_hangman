class Algorithm < ActiveRecord::Base
  has_many :entries

  attr_protected :games
  attr_protected :score
  attr_protected :password

  named_scope :best_first, { :order => "(CAST(score AS REAL) / (games + 1)) DESC" }

  validates_presence_of :code
  validates_presence_of :author
  validates_presence_of :name
  
  validates_uniqueness_of :author
  validates_uniqueness_of :name
  validates_uniqueness_of :code

  acts_as_runnable_code :classes => ["Entry"]
  
  def current_password; ""; end
end
