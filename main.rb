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

    # 0 ~ 3 の間でランダムに数字が変わる
    attack_num = rand(4)

    # 1/4 の確率で special_attack を実行
    if attack_num == 0
      damage = calculate_special_attack
    else
      damage = @offense - monster.defense
    end

    monster.hp -= damage

    puts "#{monster.name}は #{damage} のダメージを受けた"
    puts "#{monster.name}の残り HPは #{monster.hp}だ"
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

    damage = @offense - brave.defense
    brave.hp -= damage

    puts "#{brave.name}は #{damage} のダメージを受けた"
    puts "#{brave.name}の残りHPは#{brave.hp}だ"
  end

  # クラス外から呼び出せないようにする
  private

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
