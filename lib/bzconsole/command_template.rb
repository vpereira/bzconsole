# frozen_string_literal: true

module BzConsole
  class CommandTemplate
    include Bugzilla::Utils
    def initialize(plugin)
      @n_args = 0
      @defaultyamlfile = File.join(ENV['HOME'], '.bzconsole.yml')
      @plugin = plugin
    end

    attr_reader :n_args

    def parse(parser, argv, opts)
      raise format('No implementation for %s', self.class) if self.class =~ /CommandTemplate/

      parser.on('-h', '--help', 'show this message') { |_x| opts[:help] = true }

      read_config(opts)
      @plugin.run(:parser, nil, parser, argv, opts)

      parser.order(argv)
    end

    def do(_argv)
      raise format('No implementation for %s', self.class)
    end
  end
end
