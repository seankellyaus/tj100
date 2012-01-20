class Song < ActiveRecord::Base
  has_many :selections
end
