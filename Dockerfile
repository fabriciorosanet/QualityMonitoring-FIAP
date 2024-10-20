# Base image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

# Build image
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["QualityMonitoring-MongoDB.csproj", "./"]
RUN dotnet restore "./QualityMonitoring-MongoDB.csproj"
COPY . .
RUN dotnet build "./QualityMonitoring-MongoDB.csproj" -c $BUILD_CONFIGURATION -o /app/build

# Publish image
FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./QualityMonitoring-MongoDB.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# Final image
FROM base AS final
WORKDIR /app

# Copy the published files
COPY --from=publish /app/publish .

# Set environment variable for the profile
ENV ASPNETCORE_ENVIRONMENT=Dev

# Allow changing the profile via Docker command line or environment setting
ENTRYPOINT ["dotnet", "QualityMonitoring-MongoDB.dll", "--environment", "${ASPNETCORE_ENVIRONMENT}"]
