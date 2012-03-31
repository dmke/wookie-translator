# -*- encoding: utf-8 -*-

class Wookie::Translator
  def initialize(*args)
    options = args.pop if Hash === args[-1]
    options = {
      dialect: Wookie::Dialect::Simple
    }.merge(options || {})

    @dialect = options[:dialect].new
  end

  def to_wookie(str)
    @dialect.to_wookie(str)
  end

  def from_wookie(str)
    @dialect.from_wookie(str)
  end
end
