use strict;
use warnings;
use Lingua::ES::Numeros qw(num2es);
use HTTP::Server::Simple::CGI;

{
    package MyServer;
    use base 'HTTP::Server::Simple::CGI';

    sub handle_request {
        my ($self, $cgi) = @_;

        my $numero =
        $cgi->param('n');

        my $texto =
        num2es($numero);

        print "HTTP/1.0 200 OK\r\n";
        print "Content-Type: text/plain\r\n\r\n";
        print $texto;
    }
}

my $server = MyServer->new(8000);
$server->run();