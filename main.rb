require 'pry'
require './brave'
require './character'
require './games_controller'

# GamesController クラスをインスタンス化
games_controller = GamesController.new

terry = Brave.new(name: "テリー", hp: 500, offense: 200, defense: 120)
slime = Monster.new(name: "スライム", hp: 250, offense: 200, defense: 130)

# GamesController クラスの battle メソッドを使用
games_controller.battle(brabe: terry, monster: slime)
