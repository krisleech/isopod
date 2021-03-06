module Medicine

  # @api private

  class Injections
    def initialize
      @injections = {}
    end

    def fetch(name, &block)
      @injections.fetch(name, &block)
    rescue KeyError
      raise ArgumentError, "No dependency with name #{name} has been injected."
    end

    def [](name)
      @injections[name]
    end

    def set(name, dependency)
      warn "#{name} has already been injected" if include?(name)
      @injections[name] = dependency
    end

    def include?(name)
      @injections.has_key?(name)
    end

    def empty?
      @injections.empty?
    end
  end
end
