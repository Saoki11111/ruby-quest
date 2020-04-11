require './character'

class Monster < Character

  POWER_UP = 1.5
  HELP_HP = 0.5

  def initialize(**params)
    super(
      name: params[:name],
      hp: params[:hp],
      offense: params[:offense],
      defense: params[:defense]
     )

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
    damage_message(target: brave, damage: damage)
  end

  private
    
    def calculate_damage(target)
      @offense - target.defense
    end

    def cause_damage(**params)
      damage = params[:damage]
      target = params[:target]

      target.hp -= damage
      target.hp = 0 if target.hp < 0
    end

    def transform
      transform_name = "ドラゴン"

      transform_message(origin_name: @name, transform_name: transform_name)

      @offense *= POWER_UP
      @name = transform_name
    end
end

