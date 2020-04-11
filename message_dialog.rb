module MessageDialog
  def attack_message
    # 攻撃実行側のクラスの name パラメータを使用して攻撃メッセージを表示
    puts "#{@name}の攻撃"
  end

  def damage_message
  end

  def end_message
  end
end
