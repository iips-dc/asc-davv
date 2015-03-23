class Notice < ActiveRecord::Base
  attr_accessible :body, :end_date, :title
end

#field not remain blank
class  Notice < ActiveRecord::Base
  validates :body, :end_date, :title, presence: true
end