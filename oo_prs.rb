class Player 
  attr_accessor :choice
  attr_reader :name
  
  def initialize(n)
    @name = n
  end

end

class Human < Player
  def pick_hand
    begin
      puts "Pick one: (p, r, s)"
      self.choice = gets.chomp.downcase
    end until Prs::CHOICE.keys.include?(self.choice)
  end

  def to_s
    "#{self.name} is #{Prs::CHOICE[self.choice]}"
  end
end

class Computer < Player
  
  def pick_hand
    self.choice = Prs::CHOICE.keys.sample
  end

  def to_s
    "#{self.name} is #{Prs::CHOICE[self.choice]}"
  end
end

class Prs
  CHOICE = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}

  attr_accessor :me, :com

  def initialize
    @me = Human.new("player")
    @com = Computer.new("computer")
  end

  def print_winner_msg(msg)
    case msg
    when 'p'
      puts "Paper wraps Rock!"
    when 's'
      puts "Scissors cut Paper"
    when 'r'
      puts "Rock breaks Scissors"
    end
  end 

  def compare(p, c)
    if p.choice == c.choice
      puts "It's tie game!"
    elsif (p.choice == 'p' && c.choice == 'r') || (p.choice == 'r' && c.choice == 's') || (p.choice == 's' && c.choice == 'p')
      print_winner_msg(p.choice)
      puts "You won!"
    else
      print_winner_msg(c.choice)
      puts "Computer won..."
    end
  end

  def play
    puts "Welcome to play Paper, Rock and Scissors!"
    begin
      me.pick_hand
      com.pick_hand
      puts "#{me}, and #{com}"
      compare(me, com)

      puts "Play again? (y/n)"
      decision = gets.chomp.downcase
    end while decision == 'y'
  end
end

Prs.new.play