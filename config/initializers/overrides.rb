require 'simple_calendar/view_helpers'

module SimpleCalendar
  module ViewHelpers

    def month_link(text, date, params, opts={})

    end

    def month_header(selected_month, options)
      content_tag :h2 do
        previous_month = selected_month.advance :months => -1
        next_month = selected_month.advance :months => 1
        tags = []

        tags << month_link(options[:prev_text], previous_month, options[:params], {:class => "previous-month"})
        tags << "#{I18n.t("date.month_names")[selected_month.month]}"
        tags << month_link(options[:next_text], next_month, options[:params], {:class => "next-month"})

        tags.join.html_safe
      end
    end


    def draw_calendar(selected_month, month, current_date, events, options, block)
      tags = []
      today = Date.today
      content_tag(:table, :class => options[:class]) do
        tags << month_header(selected_month, options)
        day_names = I18n.t("date.abbr_day_names")
        day_names = day_names.rotate((Date::DAYS_INTO_WEEK[options[:start_day]] + 1) % 7)
        tags << content_tag(:thead, content_tag(:tr, day_names.collect { |name| content_tag :th, name, :class => (selected_month.month == Date.today.month && Date.today.strftime("%a") == name ? "current-day" : nil)}.join.html_safe))
        tags << content_tag(:tbody, :'data-month'=>selected_month.month, :'data-year'=>selected_month.year) do

          month.collect do |week|
            content_tag(:tr, :class => (week.include?(Date.today) ? "current-week week" : "week")) do

              week.collect do |date|
                td_class = ["day"]
                td_class << "today" if today == date
                td_class << "not-current-month" if selected_month.month != date.month
                td_class << "past" if today > date
                td_class << "future" if today < date
                td_class << "wday-#{date.wday.to_s}" # <- to enable different styles for weekend, etc


                cur_events = day_events(date, events)

                td_class << (cur_events.any? ? "events" : "no-events")

                content_tag(:td, :class => td_class.join(" "), :'data-date-iso'=>date.to_s, 'data-date'=>date.to_s.gsub('-', '/')) do
                  content_tag(:div , :class=>"pos-relative") do
                    divs = []
                    concat content_tag(:div, date.day.to_s, :class=>"day_number")

                    if cur_events.empty? && options[:empty_date]
                      concat options[:empty_date].call(date)
                    else
                      divs << cur_events.collect{ |event| block.call(event) }
                    end

                    divs.join.html_safe
                  end #content_tag :div
                end #content_tag :td

              end.join.html_safe
            end #content_tag :tr

          end.join.html_safe
        end #content_tag :tbody

        tags.join.html_safe
      end #content_tag :table
    end
    end
end