class LyricParser
  attr_accessor :lyrics

  def initialize(lyric_file)
    @lyrics = File.read(lyric_file)
  end

  def sanitize_lyrics
    @lyrics = @lyrics.tr("\n", " ")
    @lyrics = @lyrics.downcase.gsub(/[^a-z0-9 ]/, '')
  end

  def unique_words
    @lyrics.split(' ').uniq!
  end

  def total_unique_words
    sanitize_lyrics
    unique_words
  end

  def count_unique_words
    all = sanitize_lyrics
    word_counts = {}
    all.split(' ').map do |word|
      if word_counts.key?(word)
        word_counts[word] += 1
      else
        word_counts[word] = 1
      end
    end
    word_counts
  end

end
