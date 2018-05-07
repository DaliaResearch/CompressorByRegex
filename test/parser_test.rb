require_relative 'test_helper'

class CompressorByRegex::ParserTest < Minitest::Test
  def test_parse
    parser = CompressorByRegex::Parser.new(["0010","0012", "0022", "1005", "0023", "0024", "0027","1001", "0013", "1002"])
    assert_equal(["0010", "/^001[23]$/", "/^002[2-4]$/", "0027", "/^100[12]$/", "1005"], parser.parse)
  end

  def test_postal_codes_without_regex
    parser = CompressorByRegex::Parser.new(["0001", "5678", "1234", "0002", "EC1A"])
    assert_equal(["/^000[12]$/", "1234", "5678", "EC1A"], parser.parse)
  end
end
