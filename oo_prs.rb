class player 
  attr_accessor :choice
  attr_reader :name
  
  def initialize(n)
    @name = n
  end

end

class human < player
  def pick_hand
    begin
      puts "Pick one: (p, r, s)"
      self.choice = gets.chomp.downcase
    end until prs::CHOICE.keys.include?(self.choice)
  end

  def to_s

  end
end

class computer < player
  attr_accessor :gesture
  
  def pick_hand
    self.choice = prs::CHOICE.keys.sample
  end

end

class prs
  CHOICE = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}

  attr_accessor :human, :computer

  def initialize
    @player = human.new
  end
end

