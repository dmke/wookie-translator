# -*- encoding: utf-8 -*-

module Wookie::Dialect
  class Simple < Base
    LOOKUP = {
      "a" => "ra", "b" => "rh", "c" => "oa", "d" => "wa", "e" => "wo", "f" => "ww",
      "g" => "rr", "h" => "ac", "i" => "ah", "j" => "sh", "k" => "or", "l" => "an",
      "m" => "sc", "n" => "wh", "o" => "oo", "p" => "ak", "q" => "rq", "r" => "rc",
      "s" => "c",  "t" => "ao", "u" => "hu", "v" => "ho", "w" => "oh", "x" => "k",
      "y" => "ro", "z" => "uf"
    }.freeze
    SHORT_CODES = LOOKUP.map{|_,v| v if v.length == 1 }.compact.join

    def to_wookie(str)
      wookie = ''
      str.downcase.each_char do |c|
        wookie << (LOOKUP[c].nil? ? c : LOOKUP[c])
      end
      wookie
    end

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