module ApplicationHelper

def currency_codes
    currencies = []
    Money::Currency.table.values.each do |currency|
      currencies = currencies + [[currency[:name] + ' (' + currency[:iso_code] + ')', currency[:iso_code]]]
    end
    currencies
  end
  def store_unit
  	unit = Store.first.currency rescue 'USD'
  	Money::Currency.new(unit).symbol

  end
  def show_price(price)
  	unit = Store.first.currency rescue 'USD'
    return Money.new(price*100, unit).format rescue 0
  end

  def is_selected
    
  end

  def get_social_link(attr_name)
    link= "Store.last.#{attr_name}" rescue ''
    return eval(link)
  end

end
