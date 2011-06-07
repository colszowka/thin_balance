require 'term/ansicolor'
String.send :include, Term::ANSIColor

module ThinBalance
  class Server
    attr_reader :config
    def initialize(config)
      @config = config
    end
    
    def run!
      ensure_pen_and_thin_available!
      begin
        start_thin
        start_pen
      ensure
        stop_thin
      end
    end
    
    private
    
    def thin_ports
      @thin_ports ||= (1..config[:servers].to_i).to_a.map {|i| config[:port].to_i+i}
    end
    
    def thin_hosts
      @thin_hosts ||= thin_ports.map {|port| "localhost:#{port}"}
    end
    
    def invoke(cmd)
      puts "#{"RUNNING".green}: #{cmd.bold}"
      system cmd
    end

    def thin_command
      if File.exist?('Gemfile')
        "bundle exec thin"
      else
        "thin"
      end
    end
    
    def start_thin
      invoke "#{thin_command} start --servers #{config[:servers].to_i} -p #{thin_ports.first} -e #{config[:rack_env]} #{thin_rackup}"
    end
    
    def start_pen
      invoke "pen -f -r #{config[:port]} #{thin_hosts.join(" ")}"
    end
    
    def stop_thin
      invoke "#{thin_command} stop --servers #{config[:servers].to_i} -p #{thin_ports.first}"
    end
    
    def thin_rackup
      if File.exist?('config.ru')
        "--rackup config.ru"
      else
        ""
      end
    end
    
    def ensure_pen_and_thin_available!
      fail = false
      if `which pen`.strip.chomp.length < 5
        STDERR.print "You need to install pen:  ".red.bold, "sudo apt-get install pen or see http://siag.nu/pen/", "\n"
        fail = true
      end
      
      if `which thin`.strip.chomp.length < 5
        STDERR.print "You need to install thin: ".red.bold, "gem install thin", "\n"
        fail = true
      end
      
      exit 1 if fail
    end
  end
end
