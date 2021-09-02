FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /api
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY . .
RUN dotnet restore LetsDeploy.csproj
RUN dotnet build LetsDeploy.csproj -c Release -o /build

FROM build as publish
RUN dotnet publish LetsDeploy.csproj -c Release -o /publish

FROM base AS final
WORKDIR /api
COPY --from=publish /publish .
ENTRYPOINT ["dotnet", "LetsDeploy.dll"]