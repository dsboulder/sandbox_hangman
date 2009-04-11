class Entry < ActiveRecord::Base
  belongs_to :algorithm
  belongs_to :round

  attr_reader :guessed

  acts_as_wrapped_class :methods => [:word, :guesses, :guess!, :all_words]

  def word
    round.word.split("").collect{|l| guesses.include?(l) ? l : " "}.join
  end

  def finish!(disqualify = false)
    self.update_attribute(:finished, true)
    self.update_attribute(:disqualified, disqualify)
    score_delta = 9 - (disqualify ? 9 : self.wrong_guesses)
    log! "Disqualified!" if disqualify 
    log! "Finished, adding #{score_delta} to score"
    self.algorithm.games += 1
    self.algorithm.score += score_delta 
    self.algorithm.save!
  end

  def guesses
    super.split("")
  end

  def all_words
    Round.all_words
  end

  def guess!(char)
    raise "Must be only 1 string character" unless char.class == String && char.length == 1
    if @guessed
      raise "Can only guess once!" 
    end
    log! "Guessing #{char.inspect}"
    @guessed = true
    update_attribute(:guesses, (self.guesses + [char]).join)
    update_attribute(:wrong_guesses, self.wrong_guesses + 1) unless self.round.word.include?(char)
  end

  def log!(msg)
    round.log!(self.algorithm.name, msg)
  end
end
