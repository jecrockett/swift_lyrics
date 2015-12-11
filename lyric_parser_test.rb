require_relative 'lyric_parser'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class LyricParserTest < Minitest::Test

  def test_lyric_parser_exists
    assert LyricParser
  end

  def test_it_reads_the_file
    lp = LyricParser.new('lyrics.txt')

    assert lp.lyrics
    assert_equal String, lp.lyrics.class
  end

  def test_it_can_remove_non_letter_characters
    lp = LyricParser.new('lyrics_sample_1.txt')
    lp.sanitize_lyrics
    expected = "i said thats a lie just a boy in a chevy truck "

    assert_equal expected, lp.lyrics
  end

  def test_unique_words_with_sample
    lp = LyricParser.new('lyrics_sample_2.txt')
    lp.sanitize_lyrics

    assert_equal 8, lp.unique_words.count
  end

  def test_total_unique_lyrics_from_taylor_swift_lyric_file
    lp = LyricParser.new('lyrics.txt')

    assert_equal 1994, lp.total_unique_words.count
  end

  def test_count_unique_words_returns_hash_with_word_count
    lp = LyricParser.new('lyrics_sample_3.txt')
    expected = { "i"=>2, "hope"=>2, "you"=>2, "think"=>2, "that"=>2, "little"=>2, "black"=>2, "dress"=>2, "just"=>1, "a"=>2, "boy"=>1, "in"=>1, "chevy"=>1, "truck"=>1 }

    assert_equal expected, lp.count_unique_words
  end

end
