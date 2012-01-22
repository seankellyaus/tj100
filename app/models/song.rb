class Song < ActiveRecord::Base
  has_many :selections

  searchable do
    text :name, :artist
  end
end
