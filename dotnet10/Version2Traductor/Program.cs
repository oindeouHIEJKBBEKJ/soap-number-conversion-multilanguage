using System.ServiceModel;
using GoogleTranslateFreeApi;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", async (HttpRequest request) =>
{
    string numero = request.Query["n"];

    var binding =
        new BasicHttpBinding();

    var endpoint =
        new EndpointAddress(
        "https://www.dataaccess.com/webservicesserver/NumberConversion.wso"
    );

    var factory =
        new ChannelFactory<INumberConversion>(
        binding,
        endpoint
    );

    var client =
        factory.CreateChannel();

    string texto =
        await client.NumberToWordsAsync(
        ulong.Parse(numero)
    );

    var translator =
        new GoogleTranslate();

    var result =
        await translator.TranslateLiteAsync(
            texto,
            LanguageCode.English,
            LanguageCode.Spanish
        );

    return Results.Text(
        result.MergedTranslation
    );
});

app.Run();

[ServiceContract]
public interface INumberConversion
{
    [OperationContract]
    Task<string> NumberToWordsAsync(
        ulong ubiNum
    );
}