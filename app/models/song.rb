class Song < ActiveRecord::Base
  has_many :selections

  searchable do
    text :name, :artist
  end

  scope :by_letter,
        lambda { |letter| {
            :conditions => ["songs.name LIKE ?", "#{letter}%"]
        }}

end
