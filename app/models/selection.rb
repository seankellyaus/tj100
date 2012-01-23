class Selection < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :song

  validates_uniqueness_of :song_id, :scope => :user_id, :message => "You have already selected that song"

  SONGS_TO_SUBMIT = 40

end
