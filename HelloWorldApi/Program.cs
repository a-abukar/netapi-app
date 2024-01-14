var builder = WebApplication.CreateBuilder(args);

// Add this line to configure Kestrel to listen on all interfaces
builder.WebHost.ConfigureKestrel(serverOptions =>
{
    serverOptions.ListenAnyIP(80); // Listen for HTTP traffic on port 80
});

var app = builder.Build();

app.MapGet("/hello", () => new { Message = "Hello World" });

app.Run();
