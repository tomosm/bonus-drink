class BonusDrink

  @@bonus_for_each = 3

  def self.total_count_for(amount)
    (amount.nil? or amount.to_i <= 0) ? 0 : amount.to_i + calc_bonus(amount.to_i)
  end

  def self.calc_bonus(amount, total_bonus_amount = 0)
    bonus_amount = amount / @@bonus_for_each
    total_bonus_amount += bonus_amount
    if bonus_amount.zero?
      total_bonus_amount
    else
      calc_bonus(bonus_amount + amount - bonus_amount * @@bonus_for_each, total_bonus_amount)
    end
  end

  private_class_method :calc_bonus

end