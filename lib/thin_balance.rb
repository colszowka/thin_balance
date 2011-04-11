module ThinBalance
  autoload :CLI, 'thin_balance/cli'
  autoload :Server, 'thin_balance/server'
  
  def self.run!
    cli = ThinBalance::CLI.new
    cli.parse_options
    ThinBalance::Server.new(cli.config).run!
  end
end
