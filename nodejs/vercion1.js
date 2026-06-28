const soap = require("soap");
const http = require("http");

const wsdl =
"https://www.dataaccess.com/webservicesserver/NumberConversion.wso?WSDL";

http.createServer(async (req,res)=>{

    const url = new URL(req.url,
    `http://${req.headers.host}`);

    const numero = url.searchParams.get("n");

    soap.createClient(wsdl, function(err, client){

        client.NumberToWords(
            { ubiNum: numero },

            function(err, result){

                res.writeHead(200,{
                    "Content-Type":"text/plain"
                });

                res.end(
                    result.NumberToWordsResult
                );

            });

    });

}).listen(3000);

console.log("Servidor en puerto 3000");