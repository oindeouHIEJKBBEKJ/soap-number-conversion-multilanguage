use strict;
use warnings;
use SOAP::Lite;
use HTTP::Server::Simple::CGI;
use LWP::UserAgent;
use URI::Escape;
use JSON;

{
    package MyServer;
    use base 'HTTP::Server::Simple::CGI';

    sub handle_request {
        my ($self, $cgi) = @_;

        my $numero = $cgi->param('n');

        my $soap = SOAP::Lite
            ->service(
            'https://www.dataaccess.com/webservicesserver/NumberConversion.wso?WSDL'
        );

        my $texto =
            $soap->NumberToWords($numero);

        my $ua = LWP::UserAgent->new();

        my $url =
        "https://translate.googleapis.com/translate_a/single?client=gtx&sl=en&tl=es&dt=t&q="
        . uri_escape($texto);

        my $response =
        $ua->get($url);

        my $json =
        decode_json($response->decoded_content);

        my $traducido =
        $json->[0][0][0];

        print "HTTP/1.0 200 OK\r\n";
        print "Content-Type: text/plain\r\n\r\n";
        print $traducido;
    }
}

my $server = MyServer->new(8000);
$server->run();