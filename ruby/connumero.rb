require 'webrick'
require 'humanize'

server = WEBrick::HTTPServer.new(
  Port: 8000
)

server.mount_proc '/' do |req, res|

  numero =
    req.query['n'].to_i

  texto =
    numero.humanize(
      locale: :es
    )

  res.body = texto

end

trap('INT') { server.shutdown }

server.start