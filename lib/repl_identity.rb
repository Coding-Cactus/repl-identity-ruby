require "json"
require "open3"

require_relative "repl_identity/token"
require_relative "repl_identity/identity"

module ReplIdentity
    VERSION         = "0.3.0"
    REPL_ID         = ENV["REPL_ID"]
    REPLIT_CLI_PATH = ENV.fetch("REPLIT_CLI", "replit")
end
