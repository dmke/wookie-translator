require 'optparse'

# Command line interface for this gem.
#
# == Usage
#
#     wookie [options] string
#     wookie [options] -
#
# == Common Options
#
# +-w+ or +--from-wookie+::
#   Translate from wookiespeak to english.
#
# +-e+ or +--to-wookie+::
#   Translate from english to wookiespeak.
#
# +-dDIALECT+ or +--dialect DIALECT+::
#   Use a specific dialect (default and currently only available option: simple).
#
# +-v+ or +--version+::
#   Prints the version and exits.
#
# == Read from STDIN
#
# When the option +-+ is given, any non-option argument is ignored and reads from STDIN.
#
# == Examples
#
#     $ wookie -e 'Hello World!'
#     acwoananoo ohoorcanwa!
#     $ wookie -w 'acwoananoo ohoorcanwa!' --dialect simple
#     hello world!
#     $ echo 'rchurhro ahc raohwocooscwo :-)' | wookie -w -
#     ruby is awesome :-)
class Wookie::CLI

  # Initializes the command line interface with the command line parameters (or
  # any given argument array). See above.
  #
  # @param [Array] argv The command line arguments (`ARGV` is substituted, if `nil`).
  def initialize(argv)
    @argv = argv || ARGV
    @options = {
      :use_stdin => false,
      :dialect => :simple
    }
    OptionParser.new do |opts|
      opts.banner = "Usage: wookie [options] string\n       wookie [options] -"
      opts.separator ""
      opts.separator "Common Options"
      opts.on('-w', '--from-wookie', 'Translate from wookiespeak to english') do
        @options[:translation] = :from_wookie
      end
      opts.on('-e', '--to-wookie', 'Translate from english to wookiespeak') do
        @options[:translation] = :to_wookie
      end
      opts.on('-d', '--dialect DIALECT', [:simple], 'Use a specific dialect (defaults to simple)', 'Currently available: simple') do |dialect|
        @options[:dialect] = dialect
      end
      opts.on('-v', '--version', 'Prints the version and exits') do
        puts "Wookie Translator v#{Wookie::VERSION}.\nThis software is public domain."
        exit 0
      end
      opts.separator ""
      opts.separator "Read from STDIN"
      opts.separator '    -                                When given, ignore any non-option arguments'
      opts.separator '                                     and read from STDIN.'
    end.parse!(@argv)
  end

  # Actually executes the arguments and prints a translation.
  # @return [void]
  def run
    dialect = case @options[:dialect]
    when :simple
      @options[:dialect] = Wookie::Dialect::Simple
    else
      raise ArgumentError, "Unknown dialact."
    end
    string = if @argv.include?('-')
      ARGF.read
    else
      @argv.join(' ')
    end
    t = Wookie::Translator.new(:dialect => dialect)
    puts t.send(@options[:translation], string)
  end
end