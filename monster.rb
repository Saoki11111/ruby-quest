require './character'

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
    
    damage = calculate_damage(brave)
    cause_damage(target: brave, damage: damage)

    attack_message

    # puts "#{brave.name}の残りHPは#{brave.hp}だ"
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

      # puts "#{target.name}は#{damage} のダメージを受けた"
    end

    def transform
      transform_name = "ドラゴン"

      # puts <<~EOS
      # #{@name}は怒っている
      # #{@name}は#{transform_name}に変身した
      # EOS

      @offense *= POWER_UP
      @name = transform_name
    end

end

