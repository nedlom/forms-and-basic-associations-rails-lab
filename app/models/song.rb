class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    if self.artist
      self.artist.name
    else
      nil
    end
  end

  def note_contents=(contents)
    contents.each do |note|
      self.notes << Note.new(content: note)
    end

  end

  def note_contents
    if self.notes
      self.notes.map do |note|
        note.content
      end
    else
      nil
    end
  end

end
