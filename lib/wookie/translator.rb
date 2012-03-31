# -*- encoding: utf-8 -*-

# Translates a given string either from wookie to english or vice versa.
class Wookie::Translator

  # Contructor, defines the dialect ({Wookie::Dialect::Simple} by default).
  # @param [Hash] options The instance options.
  # @option options [#to_wookie,#from_wookie] :dialect A wookie dialect.
  def initialize(options={ :dialect => Wookie::Dialect::Simple })
    @dialect = options[:dialect].new
  end

  # Translates an english string to wookiespeak using the dialect given to the
  # initializer.
  #
  # @param [#to_s] str The string to be translated.
  # @return [String] The translated string.
  def to_wookie(str)
    @dialect.to_wookie(str.to_s)
  end

  # Translates a string from wookiespeak to english using the dialect given to
  # the initializer.
  #
  # @param [#to_s] str The string to be translated.
  # @return [String] The english translation.
  def from_wookie(str)
    @dialect.from_wookie(str.to_s)
  end
end
