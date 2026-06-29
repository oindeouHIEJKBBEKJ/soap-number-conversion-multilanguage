using System.ServiceModel;
using System.ServiceModel.Channels;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", async (HttpRequest request) =>
{
    string numero = request.Query["n"];

    var binding = new BasicHttpBinding();

    var endpoint =
        new EndpointAddress(
        "https://www.dataaccess.com/webservicesserver/NumberConversion.wso"
    );

    var factory =
        new ChannelFactory<INumberConversion>(
        binding,
        endpoint
    );

    var client = factory.CreateChannel();

    string resultado =
        await client.NumberToWordsAsync(
        ulong.Parse(numero)
    );

    return Results.Text(resultado);
});

app.Run();

[ServiceContract]
public interface INumberConversion
{
    [OperationContract]
    Task<string> NumberToWordsAsync(ulong ubiNum);
}