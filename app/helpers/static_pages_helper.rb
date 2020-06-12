module StaticPagesHelper
    def mode(city)
        current_hour = city.current_time.hour
        if current_hour >= 9 and current_hour < 18
            return "<span class='work'>#{fa_icon 'circle'}</span>".html_safe
        elsif current_hour >= 18 and current_hour < 20
            return "<span class='overtime'>#{fa_icon 'circle'}</span>".html_safe
        elsif current_hour >= 23 or current_hour < 8
            return "<span class='sleep'>#{fa_icon 'star'}</span>".html_safe
        else
            return "<span class='personal'>#{fa_icon 'circle'}</span>".html_safe
        end
    end

    def clock(city)
        if session[:twentyfour].nil? or session[:twentyfour] == true
            return city.get_longtime_string
        else
            return city.get_shorttime_string
        end
    end

    def day(city)
        day = Time.use_zone('Australia/Melbourne'){
            if city.current_time.day < Time.zone.now.day
                return 'yesterday'
            elsif city.current_time.day > Time.zone.now.day
                return 'tomorrow'
            else
                return 'today'
            end
        }
    end
end