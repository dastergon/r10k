require 'r10k/errors'

module R10K
  module Git

    class GitError < R10K::Error; end

    class UnresolvableRefError < GitError

      attr_reader :ref
      attr_reader :git_dir

      def initialize(mesg, options = {})
        if mesg.is_a? Hash
          options = mesg
          mesg    = nil
        end
        super
        @ref     = @options[:ref]
        @git_dir = @options[:git_dir]
      end

      def message
        if @mesg
          msg = @mesg
        else
          msg = "Could not resolve Git reference"

          if @ref
            msg << " '#{@ref}'"
          end
        end

        if @git_dir
          msg << " at #{@git_dir}"
        end

        msg
      end
    end
  end
end
