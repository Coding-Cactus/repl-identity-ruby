module ReplIdentity
    class Identity
        attr_reader :audience, :repl_slug, :username, :repl_id, :origin, :ephemeral, :origin_repl_id
        
        def initialize(token)
            stdout, status = Open3.capture2(
                REPLIT_CLI_PATH, "identity", "verify",
                "-audience=#{REPL_ID}",
                "-token=#{token}",
                "-json"
            )
            print "\r" + "\e[A\e[K" unless status.success? # Remove error message from replit process

            identity = status.success? ? JSON.parse(stdout) : {}

            @verified       = status.success?            
            @audience       = identity["aud"]
            @repl_slug      = identity["slug"]
            @username       = identity["user"]
            @repl_id        = identity["replid"]
            @origin         = identity["origin"]
            @ephemeral      = identity["ephemeral"]
            @origin_repl_id = identity["originReplid"]
        end

        def verified?
            @verified
        end
    end
end
