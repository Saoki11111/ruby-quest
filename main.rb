class Brave
  # initializeメソッドを定義
  def initialize
    @name = 'テリー'
    @hp = 500
    @offense = 150
    @defense = 100
  end

  ## nameのセッター
  #def name=(name)
  #  @name = name
  #end

  # nameのゲッター
  def name
    @name
  end

  ## hpのセッター
  #def hp=(hp)
  #  @hp = hp
  #end

  # hpのゲッター
  def hp
    @hp
  end
 
  ## offenseのセッター
  #def offense=(offense)
  #  @offense = offense
  #end

  # offenseのゲッター
    def offense
      @offense
    end

  ## defenseのセッター
  #def defense=(defense)
  #  @defense = defense
  #end

  # defenseのゲッター
  def defense
    @defense
  end

end

# 勇者クラスをインスタンス化
brave = Brave.new

## パラメータに値を設定
#brave.name = 'テリー'
#brave.hp = 500
#brave.offense = 150
#brave.defense = 100
# -> initialize method

# 値を取り出す
# puts "NAME:#{brave.name}"
# puts "HP:#{brave.hp}"
# puts "OFFENSE:#{brave.offense}"
# puts "DEFENSE:#{brave.defense}"

# ヒアドキュメントで
puts <<~TEXT
NAME:#{brave.name}
HP:#{brave.hp}
OFFENSE:#{brave.offense}
DEFENSE:#{brave.defense}
TEXT
