class City < ApplicationRecord
    validates :name, presence: true, uniqueness: { case_sensitive: false }

    def self.city_list(session_data)
        cities = []
        session_data.each do |item|
            cities.push(City.find(item))
        end

        return cities
    end

    def self.populate_list
        cities = []
        id = City.find_by(name: 'Melbourne').id
        cities.push(id)

        for item in 0..1
            while cities.include? id
                id = City.all.sample.id
            end
            cities.push(id)
        end
                
        return cities
    end

    def current_time
        return Time.now.getlocal(self.offset.hours)
    end

    def get_longtime_string
        return self.current_time.strftime "%H:%M"
    end

    def get_shorttime_string
        return self.current_time.strftime("%I:%M"), self.current_time.strftime("%P")
    end

    def difference
        return "#{self.offset - 10}h"
    end
end

# # Schema:
# string name
# string region
# integer offset //offset from UTC-0
# string value
# datetime created_at, null: false
# datetime updated_at, null: false