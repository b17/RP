module DateTimeFormatterHelper

  def self.date_time date
    date.strftime(I18n.t 'date_hour_format')
  end

  def self.short_date date
    date.strftime(I18n.t 'hour_date_format')
  end
end
