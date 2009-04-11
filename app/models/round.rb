class Round < ActiveRecord::Base
  has_many :entries do
    def unfinished
      self.find(:all, :conditions => {:finished => false})
    end
  end

  before_create :choose_random_word
  after_create :enter_all_algorithms

  def self.all_words
    @all_words ||= File.open(RAILS_ROOT + "/common-words").readlines.collect!{|w| w.strip}.reject!{|w| w.length < 5}
  end

  def self.iterate_or_create!
    last_round = Round.last
    last_round = Round.create! if !last_round || last_round.finished?
    last_round.iterate!
  end

  def iterate!
    return if self.finished?
    entries.unfinished.each do |entry|
      begin
        entry.algorithm.run_code(entry)
      rescue Exception => e
        log!(entry.algorithm.name, "Exception: #{e}")
      end
      entry.finish! if entry.word == self.word || entry.wrong_guesses >= 9
      entry.finish!(true) unless entry.guessed
    end
    self.update_attribute(:iterations, self.iterations + 1)
    self.update_attribute(:finished, true) if entries.unfinished.empty? || self.iterations == 26
  end

  def log!(name, msg)
    str = "#{name.gsub("\n", "")}: #{msg.gsub("\n", "")}"
    puts "  " + str
    self.update_attribute(:log, self.log + str + "\n")
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
