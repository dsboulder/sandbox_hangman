class Round < ActiveRecord::Base
  has_many :entries

  before_save :choose_random_word
  after_save :enter_all_algorithms

  def self.all_words
    @all_words ||= File.open("/usr/share/common-words").readlines.collect!{|w| w.strip}.reject!{|w| w.length < 5}
  end

  private

  def choose_random_word
    self.word = Round.all_words.rand
  end

  def enter_all_algorithms
    Algorithm.all.each do |a|
      entries.create!(:algorithm => a)
    end
  end
end
