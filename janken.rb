class Acchimuitehoi

  def initialize
    @jankens = ["グー","チョキ","パー","戦わない"]
    @directions = ["上","下","左","右"]
    @bar = "----------------"
  end

  def janken
    puts "最初はグーじゃんけん..."
    puts "0(グー) 1(チョキ) 2(パー) 3(戦わない)"

    player_hand = gets.to_i
    program_hand = rand(3)

    if player_hand == 3
      puts "じゃんけんを終了します"
      exit
    elsif player_hand == 0 || player_hand == 1 || player_hand == 2
      puts "ホイ！"
      puts @bar
      puts "あなた：#{@jankens[player_hand]}を出しました\n" + "相手：#{@jankens[program_hand]}を出しました"
      puts @bar
      if player_hand == program_hand
        puts "あいこです"
        return true
      elsif (player_hand == 0 && program_hand == 1) || (player_hand == 1 && program_hand == 2) || (player_hand == 2 && program_hand == 0)
        @janken_result = "win"
        return acchimuite
      else
        @janken_result = "lose"
        return acchimuite
      end
    else
      puts "不正な値です"
      return true
    end
  end

  def acchimuite
    puts "あっち向いて〜"
    puts "0(上) 1(下) 2(右) 3(左)"

    player_hand = gets.to_i
    program_hand = rand(4)

    if (player_hand == program_hand && @janken_result == "win")
      puts "ホイ！"
      puts @bar
      puts "あなた：#{@directions[player_hand]}を指差しました\n" + "相手：#{@directions[program_hand]}を指差しました"
      puts @bar
      puts "おめでとう！あなたの勝ちです！"
      return false
    elsif (player_hand == program_hand && @janken_result == "lose")
      puts "ホイ！"
      puts @bar
      puts "あなた：#{@directions[player_hand]}を指差しました\n" + "相手：#{@directions[program_hand]}を指差しました"
      puts @bar
      puts "残念．．．あなたの負けです"
      return false 
    elsif player_hand > 3
      puts "不正な値です"
      return acchimuite
    else
      puts "ホイ！"
      puts @bar
      puts "あなた：#{@directions[player_hand]}を指差しました\n" + "相手：#{@directions[program_hand]}を指差しました"
      puts @bar
      return true  
    end
  end
end

next_game = true

while next_game
  game = Acchimuitehoi.new
  next_game = game.janken
end