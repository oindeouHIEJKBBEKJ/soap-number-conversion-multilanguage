#include <iostream>
#include "soapH.h"
#include "NumberConversionSoap.nsmap"

int main()
{
    struct soap soap;

    soap_init(&soap);

    _ns1__NumberToWords req;
    _ns1__NumberToWordsResponse res;

    req.ubiNum = 10;

    if (soap_call___ns1__NumberToWords(
        &soap,
        "https://www.dataaccess.com/webservicesserver/NumberConversion.wso",
        NULL,
        &req,
        &res
    ) == SOAP_OK)
    {
        std::cout
            << res.NumberToWordsResult
            << std::endl;
    }

    soap_destroy(&soap);
    soap_end(&soap);
    soap_done(&soap);

    return 0;
}
