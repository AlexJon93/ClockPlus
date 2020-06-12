class City < ApplicationRecord
    validates :name, presence: true

    def current_time
        return Time.now.getlocal(self.offset.hours)
    end

    def get_longtime_string
        return self.current_time.strftime "%H:%M"
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