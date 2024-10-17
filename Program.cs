using monitoramento_ambiental_mongodb.Data;
using monitoramento_ambiental_mongodb.Services;

var builder = WebApplication.CreateBuilder(args);

// Configura��es do MongoDB usando appsettings.json
builder.Services.Configure<DataBaseSettings>(builder.Configuration.GetSection("Database"));

// Adiciona o contexto do MongoDB
builder.Services.AddScoped<MongoDBContext>();

// Adiciona os servi�os
builder.Services.AddScoped<PrevisaoChuvaService>();
builder.Services.AddScoped<AlertaService>();

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseAuthorization();
app.MapControllers();

app.Run();

