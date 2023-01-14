module ReplIdentity
    class Token        
        def initialize(audience)
            token, status = Open3.capture2(
                REPLIT_CLI_PATH, "identity", "create",
                "-audience=#{audience}"
            )

            raise "Something went wrong" unless status.success?

            @token = token.strip
        end

        def to_s
            @token
        end
    end
end
