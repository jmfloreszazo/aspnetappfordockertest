FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /app

COPY *.sln .
COPY aspnetappfordockertest/*.csproj ./aspnetappfordockertest/
RUN dotnet restore

COPY aspnetappfordockertest/. ./aspnetappfordockertest/
WORKDIR /app/aspnetappfordockertest
RUN dotnet publish -c Release -o out


FROM microsoft/dotnet:2.1-aspnetcore-runtime AS runtime
WORKDIR /app
COPY --from=build /app/aspnetappfordockertest/out ./
ENTRYPOINT ["dotnet", "aspnetapp.dll"]
