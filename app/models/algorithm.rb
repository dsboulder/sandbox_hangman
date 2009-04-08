class Algorithm < ActiveRecord::Base
  attr_protected :games
  attr_protected :score
 
  named_scope :best_first, { :order => "score / (games + 1) DESC" }

  acts_as_runnable_code :classes => ["Entry"] #, :timeout => 1.0

end
