module Exec
  class NonZeroExitCodeException < Exception
    def initialize
    end
  end
  class CommandNotFoundException < Exception
    def initialize
    end
  end
  class << self
    alias :_system :system
    def system(*args)
      _system(*args)
      case _system(*args)
        when true ; true
        when nil  ; raise CommandNotFoundException
        else $?.exitstatus
      end
    end
    def system_v(*args)
      $stderr.puts(*args)
      case _system(*args)
        when true ; true
        when nil  ; raise CommandNotFoundException
        else $?.exitstatus
      end
    end
    def system!(*args)
      case _system(*args)
        when true ; true
        when nil  ; raise CommandNotFoundException
        else      ; raise NonZeroExitCodeException
      end
    end
    def system_v!(*args)
      $stderr.puts(*args)
      case _system(*args)
        when true ; true
        when nil  ; raise CommandNotFoundException
        else      ; raise NonZeroExitCodeException
      end
    end
  end
end

