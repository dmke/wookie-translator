# -*- encoding: utf-8 -*-

module Wookie::Dialect
  class Base
    def self.inherited(sub)
      @@subclasses ||= []
      @@subclasses << sub
    end

    def self.subclasses
      @@subclasses
    end

    def to_wookie(str)
      raise NotImplementedError
    end

    def from_wookie(str)
      raise NotImplementedError
    end
  end

  autoload :Simple, 'wookie/dialects/simple'
end