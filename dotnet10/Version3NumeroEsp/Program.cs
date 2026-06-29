using Humanizer;
using System.Globalization;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", (HttpRequest request) =>
{
    int numero =
        int.Parse(
        request.Query["n"]
        );

    string texto =
        numero.ToWords(
        new CultureInfo("es")
        );

    return Results.Text(texto);
});

app.Run();