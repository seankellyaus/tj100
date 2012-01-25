class Song < ActiveRecord::Base
  has_many :selections

  searchable do
    text :name, :artist
  end

  scope :h100_list, where('place > 0')

  scope :by_letter,
        lambda { |letter| {
            :conditions => ["songs.name LIKE ?", "#{letter}%"]
        }}

  def self.import_cleanup
    Song.find_each do |song|
      song.name = song.name.gsub('**', ',')
      song.artist = song.artist.gsub('**', ',')
      song.save
    end
  end


end
