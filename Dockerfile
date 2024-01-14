# Use the official image as a parent image
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env

# Set the working directory
WORKDIR /app

# Copy the csproj file and restore any dependencies (via NuGet)
COPY ./HelloWorldApi/*.csproj ./
RUN dotnet restore

# Copy the project files and build our release
COPY ./HelloWorldApi ./
RUN dotnet publish -c Release -o out

# Generate runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "HelloWorldApi.dll"]
