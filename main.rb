require 'pry'

class Brave
  attr_reader :name, :offense, :defense
  attr_accessor :hp

  # 必殺攻撃の計算に使う定数
  SPECIAL_ATTACK_CONSTANT = 1.5

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

  # 引数でモンスタークラスのインスタンスを受け取る
  def attack(monster)
    puts "#{@name}の攻撃"

    # decision_attack_typeメソッドの呼び出し type に入れる
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
      'special_attack'
    else
      'normal_attack'
    end
  end

  def calculate_damage(**params)

    target = params[:target]
    attack_type = params[:attack_type]

    if attack_type == "special_attack"
      calculate_special_attack - monster.defense
    else
      @offense - monster.defense
    end
  end

  def cause_damage(monster, damage)
    monster.hp -= damage
    puts "#{monster.name}は#{damage}のダメージを受けた"
  end

  def calculate_special_attack
    @offense * SPECIAL_ATTACK_CONSTANT
  end

end

class Monster
  attr_reader :name, :offense, :defense
  attr_accessor :hp, :name

  POWER_UP = 1.5
  HELP_HP = 0.5

  # **params でハッシュ形式のみしか受け付けないようにする
  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
    @transformation = false

    # @transformation_hp = params[:hp] / 2
    @transformation_hp = params[:hp] * HELP_HP
  end

  def attack(brave)
    if @hp <= @transformation_hp && @transformation == false
      @transformation = true
      transform
    end
    
    puts "#{@name}の攻撃"

    # ダメージ計算処理の呼び出し
    damage = caluclate_damage(target: brave, damage: damage) 

    brave.hp -= damage

    puts "#{brave.name}の残りHPは#{brave.hp}だ"
  end

  private

    # ダメージ計算処理
    def calculate_damage(target)
      # 引数で受け取った値を変数に格納
      damage = params[:damage]
      damage = params[:target]

      target.hp -= damage
      puts "#{brave.name}は #{damage} のダメージを受けた"
    end

    def transform
      transform_name = "ドラゴン"

      puts <<~EOS
      #{@name}は怒っている
      #{@name}は#{@transform_name}に変身した
      EOS

      @offense *= POWER_UP
      @name = transform_name
    end

end

# 勇者クラスとモンスタークラスをインスタンス化
# ハッシュ形式なのでどんなデータか把握しやすくなる
brave = Brave.new(name: "テリー", hp: 500, offense: 200, defense: 120)
monster = Monster.new(name: "スライム", hp: 250, offense: 200, defense: 130)

brave.attack(monster)
monster.attack(brave)
