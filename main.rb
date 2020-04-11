require 'pry'

# 親クラス
class Character
  attr_reader :offense, :defense
  attr_accessor :hp, :name

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end
end

class Brave < Caracter
  SPECIAL_ATTACK_CONSTANT = 1.5

  def attack(monster)
    puts "#{@name}の攻撃"

    attack_type = decision_attack_type
    damage = calculate_damage(target: monster, attack_type: attack_type)
    cause_damage(target: monster, damage: damage)

    puts "#{monster.name}の残り HPは #{monster.hp}だ"
  end

  private

  def decision_attack_type
    # 攻撃の種類の判定
    attack_num = rand(4)

    if attack_num == 0
      puts '必殺攻撃'
      'special_attack'
    else
      puts '通常攻撃'
      'normal_attack'
    end
  end

  def calculate_damage(**params)
    target = params[:target]
    attack_type = params[:attack_type]

    if attack_type == "special_attack"
      calculate_special_attack - target.defense
    else
      @offense - target.defense
    end
  end

  def cause_damage(**params)
    damage = params[:damage]
    target = params[:target]

    target.hp -= damage

    # もしターゲットの HP がマイナスになるなら0を代入
    target.hp = 0 if target.hp < 0

    puts "#{target.name}は#{damage}のダメージを受けた"
  end

  def calculate_special_attack
    @offense * SPECIAL_ATTACK_CONSTANT
  end

end

class Monster < Character

  POWER_UP = 1.5
  HELP_HP = 0.5

  def initialize(**params)
    # Character クラスの initialize メソッドの処理を渡す
    # 通常のメソッドと同様に引数を渡すことが出来る
    super(
      name: params[:name],
      hp: params[:hp],
      offense: params[:offense],
      defense: params[:defense]
     )

    # 親クラスでは定義していない処理はそのまま残す

    @transformation = false
    @transformation_hp = params[:hp] * HELP_HP
  end

  def attack(brave)
    if @hp <= @transformation_hp && @transformation == false
      @transformation = true
      transform
    end
    
    puts "#{@name}の攻撃"

    damage = calculate_damage(brave)
    cause_damage(target: brave, damage: damage)

    puts "#{brave.name}の残りHPは#{brave.hp}だ"
  end

  private
    
    def calculate_damage(target)
      @offense - target.defense
    end

    def cause_damage(**params)
      damage = params[:damage]
      target = params[:target]

      target.hp -= damage

      # もしターゲットの HP がマイナスになるなら0を代入
      target.hp = 0 if target.hp < 0

      puts "#{target.name}は#{damage} のダメージを受けた"
    end

    def transform
      transform_name = "ドラゴン"

      puts <<~EOS
      #{@name}は怒っている
      #{@name}は#{transform_name}に変身した
      EOS

      @offense *= POWER_UP
      @name = transform_name
    end

end

# 勇者クラスとモンスタークラスをインスタンス化
# ハッシュ形式なのでどんなデータか把握しやすくなる
brave = Brave.new(name: "テリー", hp: 500, offense: 200, defense: 120)
monster = Monster.new(name: "スライム", hp: 250, offense: 200, defense: 130)

loop do
  brave.attack(monster)

  # 1 行で記述
  break if monster.hp <= 0

  monster.attack(brave)

  # 1行で記述
  break if brave.hp <= 0
end

battle_result = brave.hp > 0

if battle_result
  exp = (monster.offense + monster.defense) * 2
  gold = (monster.offense + monster.defense) * 3
  puts "#{brave.name}はたたかいに勝った"
  puts "#{exp}の経験値と#{gold}ゴールを獲得した"
else
  puts "#{brave.name}はたたかいに負けた"
  puts "目の前が真っ暗になった"
end
