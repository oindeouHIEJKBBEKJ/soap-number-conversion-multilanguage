const soap = require("soap");
const translate = require("translate-google");
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

        async function(err, result){

            const texto =
            result.NumberToWordsResult;

            const traducido =
            await translate(texto,{to:'es'});

            res.end(traducido);

        });

    });

}).listen(3000);