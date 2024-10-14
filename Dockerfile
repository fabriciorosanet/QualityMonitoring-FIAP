#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER app
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

# Build image
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["QualityMonitoring-MongoDB.csproj", "./"]
RUN dotnet restore "./QualityMonitoring-MongoDB.csproj"
COPY . ./
WORKDIR "/src/."
RUN dotnet build "./QualityMonitoring-MongoDB.csproj" -c $BUILD_CONFIGURATION -o /app/build

# Publish image
#FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["QualityMonitoring-MongoDB.csproj", "."]
RUN dotnet restore "./QualityMonitoring-MongoDB.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "./QualityMonitoring-MongoDB.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./QualityMonitoring-MongoDB.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# Final image
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "QualityMonitoring-MongoDB.csproj.dll"]
