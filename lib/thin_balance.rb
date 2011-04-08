module ThinBalance
  autoload :CLI, 'thin_balance/cli'
  autoload :Server, 'thin_balance/server'
  
  def self.run!
    ThinBalance::Server.new(ThinBalance::CLI.new.config).run!
  end
end
