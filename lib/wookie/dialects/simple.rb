# -*- encoding: utf-8 -*-

module Wookie::Dialect

  # A simple wookie dialect found on the net. Works case insensitive (i.e. any
  # string to be translated will be converted to downcase).
  #
  # @see http://selarips.free.fr/wookieetranslator/
  class Simple < Base
    # The basic lookup table.
    LOOKUP = {
      'a' => 'ra', 'b' => 'rh', 'c' => 'oa', 'd' => 'wa', 'e' => 'wo', 'f' => 'ww',
      'g' => 'rr', 'h' => 'ac', 'i' => 'ah', 'j' => 'sh', 'k' => 'or', 'l' => 'an',
      'm' => 'sc', 'n' => 'wh', 'o' => 'oo', 'p' => 'ak', 'q' => 'rq', 'r' => 'rc',
      's' => 'c',  't' => 'ao', 'u' => 'hu', 'v' => 'ho', 'w' => 'oh', 'x' => 'k',
      'y' => 'ro', 'z' => 'uf'
    }.freeze

    # A short code is defined by a length of 1 of a lookup value.
    SHORT_CODES = LOOKUP.map{|_,v| v if v.length == 1 }.compact.join

    # Translates an english string to wookiespeack.
    #
    # @param [String] The string to be translated.
    # @return [String] The translation.
    def to_wookie(str)
      wookie = ''
      str.downcase.each_char do |c|
        wookie << (LOOKUP[c].nil? ? c : LOOKUP[c])
      end
      wookie
    end

    # Translates a wookiespeak string to english.
    #
    # @param [String] The string to be translated.
    # @return [String] The translation.
    def from_wookie(str)
      chars = str.downcase.split('')
      lookup = Hash[ LOOKUP.to_a.map(&:reverse) ]
      english = ''
      offset = 0
      while offset < chars.length
        cur = chars[offset]
        nxt = chars[offset,2].join
        if lookup.keys.include?(cur)
          english << lookup[cur]
        elsif lookup.keys.include?(nxt)
          english << lookup[nxt]
          offset += 1
        else
          english << cur
        end
        offset += 1
      end
      english
    end

  end
end