# WookieTranslator

*2012/04/01*

This gem is based on http://selarips.free.fr/wookieetranslator/ and built after
a tweet from [@MikeSwole](https://twitter.com/#!/MikeSwole/status/185882254432677888).

## Installation

Add this line to your application's Gemfile:

    gem 'wookie-translator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wookie-translator

## Usage

The gem comes with a command line interface:

    $ wookie -e "enter your text here!"
    $ wookie -w "wowhaoworc rooohurc aowokao acworcwo!"

You may also use the gem's API:

    require 'wookie-translator'
    t = Wookie::Translator.new
    wookie = t.to_wookie "Hello World."
    english = t.from_wookie wookie #=> "hello world."

If you want to use another wookie dialect, you want to inherit from
`Wookie::Dialect::Base` and implement the methods `#to_wookie` and `#from_wookie`:

    require 'wookie-translator'
    class ReverseWookie < Wookie::Dialect::Base
      def to_wookie(english)
        english.reverse
      end

      def from_wookie(wookie)
        wookie.reverse
      end
    end

    t = Wookie::Translator.new(dialect: ReverseWookie)
    wookie = t.to_wookie "Hello World." #=> ".dlroW olleH"
    english = t.from_wookie wookie #=> "Hello World."

## Contributing

The wookie translator lacks of translations for the three main dialects:
Shyriiwook, Xaczik and Thykarann. If you are a native speaker (or at least
familiar with one of those dialects), you're encouraged to follow these steps:

1. Fork it
2. Create your dialect branch (`git checkout -b dialect-X`)
3. Build a new dialect class
4. Commit your changes (`git commit -am 'Added missing dialect'`)
5. Push to the branch (`git push origin dialect-X`)
6. Create new Pull Request

## License

This code is public domain. Remember that »Wookie« and »Star Wars« are courtesy
of [LucasArts](http://www.lucasarts.com/).
