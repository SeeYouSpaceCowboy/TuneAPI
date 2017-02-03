class AlbumShowSerializer < ActiveModel::Serializer
  attributes :id, :title, :song_count
  has_many :songs
  belongs_to :artist

  def song_count
    object.songs.count
  end
end
