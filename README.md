# Repl Identity - Ruby

Simple implementation of Repl Identity using the `replit` command line tool. The standard use case of this is being able to access a database securely within the cover page of a repl.

## Example - Favourite Colours DB

### Client
```ruby
require "http"
require "repl_identity"

SERVER_URL     = "server-url"
SERVER_REPL_ID = "id-of-server-repl"

TOKEN = ReplIdentity::Token.new(SERVER_REPL_ID)

loop do
    print "\e[H\e[2J\e[3J1. See list of people's favourite colours\n2. Enter your own favourite colour\nEnter 1/2: "
    
    case gets.chomp
    when "1"
        puts
        JSON.parse(HTTP.get(SERVER_URL)).each { |username, colour| puts "#{username}: #{colour}" }

        puts "Press [enter] to return to menu"
        gets
    when "2"    
        print "Enter your favourite colour: "
        colour = gets.chomp
        
        HTTP.post(SERVER_URL, form: { token: token, colour: colour })
    end
end
```

### Server - Sinatra Implementation
```ruby
require "repldb"
require "sinatra"
require "repl_identity"

set :bind, "0.0.0.0"

DB      = Client.new
CLIENT_REPL_ID = "client-repl-id"

get "/" do
    DB.get_hash
end

post "/" do
    token, colour = params[:token], params[:colour]

    identity = ReplIdentity::Identity.new(token)

    halt 401 unless identity.verified? &&
        [identity.repl_id, identity.origin_repl_id].include?(CLIENT_REPL_ID)

    DB.set(identity.username, colour)

    halt 200
end
```

See this example in action:
- Client: https://replit.com/@CodingCactus/repl-identity-example-client
- Server: https://replit.com/@CodingCactus/repl-identity-example-server
