require 'webrick'
require 'savon'
require 'google_translate'

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

  texto =
    response.body[:number_to_words_response]
            [:number_to_words_result]

  traducido =
    GoogleTranslate.translate(
      texto,
      to: 'es'
    )

  res.body = traducido

end

trap('INT') { server.shutdown }

server.start