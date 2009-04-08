class Algorithm < ActiveRecord::Base
  attr_protected :games
  attr_protected :score
 
  named_scope :best_first, { :order => "score / (games + 1) DESC" }

end
