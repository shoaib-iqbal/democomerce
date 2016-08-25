module ApplicationHelper

def currency_codes
    currencies = []
    Money::Currency.table.values.each do |currency|
      currencies = currencies + [[currency[:name] + ' (' + currency[:iso_code] + ')', currency[:iso_code]]]
    end
    currencies
  end
  def show_price(price)
  	unit = Store.first.currency rescue 'USD'
    return Money.new(price*100, unit).format
  end

  def is_selected
    
  end

end
