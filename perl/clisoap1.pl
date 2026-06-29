use strict;
use warnings;
use SOAP::Lite;
use HTTP::Server::Simple::CGI;

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

        my $resultado =
            $soap->NumberToWords($numero);

        print "HTTP/1.0 200 OK\r\n";
        print "Content-Type: text/plain\r\n\r\n";
        print $resultado;
    }
}

my $server = MyServer->new(8000);
$server->run();