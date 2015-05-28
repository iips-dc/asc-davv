class Notice < ActiveRecord::Base
  attr_accessible :body, :end_date, :title
  
  #field not remain blank
  validates :body, :end_date, :title, presence: true
end