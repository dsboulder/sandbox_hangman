class Algorithm < ActiveRecord::Base
  attr_protected :games
  attr_protected :score
 
  named_scope :best_first, { :order => "(CAST(score AS REAL) / (games + 1)) DESC" }

  acts_as_runnable_code :classes => ["Entry"]
end
