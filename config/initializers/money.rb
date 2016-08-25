MoneyRails.configure do |config|
    config.default_currency = :eur
    config.register_currency = {
        :id                  => :euc, 
        :priority            => 1,
        :iso_code            => "EUR",
        :name                => "Euro with Comma decimal mark",
        :symbol              => "€",
        :symbol_first        => true,
        :subunit             => "Cent",
        :subunit_to_unit     => 0,
        :thousands_separator => ".",
        :decimal_mark        => ","
    }

end