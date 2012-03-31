# -*- encoding: utf-8 -*-

module Wookie::Dialect

  # Basic class to be inherited from, when building new dialects.
  # Though currently not implemented, a future version of the {Wookie::Translator}
  # may check, if any given dialect is actually a subclass of {Wookie::Dialect::Base}.
  class Base

    # Keeps track of available subclasses.
    # @param [Class] sub The subclass.
    def self.inherited(sub)
      @@subclasses ||= []
      @@subclasses << sub
    end

    # Returns the known subclasses
    # @return [Array] A list of known subclasses.
    def self.subclasses
      @@subclasses
    end

    # Translates an english string to wookiespeack.
    #
    # @note Must be implemented in the sub class.
    # @param [String] The string to be translated.
    # @return [String] The translation.
    # @raise NotImplementedError
    def to_wookie(str)
      raise NotImplementedError
    end

    # Translates a wookiespeak string to english.
    #
    # @note Must be implemented in the sub class.
    # @param [String] The string to be translated.
    # @return [String] The translation.
    # @raise NotImplementedError
    def from_wookie(str)
      raise NotImplementedError
    end
  end

  autoload :Simple, 'wookie/dialects/simple'
end