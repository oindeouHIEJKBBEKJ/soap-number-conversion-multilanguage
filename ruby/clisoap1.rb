require 'webrick'
require 'savon'

server = WEBrick::HTTPServer.new(
  Port: 8000
)

server.mount_proc '/' do |req, res|

  numero = req.query['n']

  client = Savon.client(
    wsdl: 'https://www.dataaccess.com/webservicesserver/NumberConversion.wso?WSDL'
  )

  response = client.call(
    :number_to_words,
    message: { ubiNum: numero }
  )

  resultado =
    response.body[:number_to_words_response]
            [:number_to_words_result]

  res.body = resultado

end

trap('INT') { server.shutdown }

server.start