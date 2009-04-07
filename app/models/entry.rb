class Entry < ActiveRecord::Base
  belongs_to :algorithm
  belongs_to :round

  def word
    round.word.split("").collect{|l| guesses.include?(l) ? l : " "}.join
  end

  def guesses
    super.split("")
  end

  def all_words
    Round.all_words
  end

  def guess!(char)
    raise "Must be only 1 character" unless char.class == String && char.length == 1
    raise "Can only guess once!" if @guessed
    @guessed = true
    update_attribute(:guesses, (self.guesses + [char]).join)
  end
end
