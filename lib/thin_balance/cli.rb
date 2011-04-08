require 'mixlib/cli'

module ThinBalance
  class CLI
    include Mixlib::CLI

    option :rack_env, 
      :short => "-e ENV",
      :long  => "--environment ENV",
      :default => 'development',
      :description => "The RACK_ENV to use"
      
    option :port,
      :short => "-p PORT",
      :long  => "--port PORT",
      :default => '3000',
      :description => "The starting port to use"
      
    option :servers,
      :short => "-s SERVERS",
      :long  => "--servers SERVERS",
      :default => '3',
      :description => "The number of thin instances to launch"

    option :help,
      :short => "-h",
      :long => "--help",
      :description => "Show this message",
      :on => :tail,
      :boolean => true,
      :show_options => true,
      :exit => 0

  end
end
