FROM microsoft/aspnetcore-build AS Build
WORKDIR /code
COPY *.csproj ./
RUN dotnet restore
COPY . ./
RUN dotnet publish -c Release -o out

FROM microsoft/aspnetcore
WORKDIR /app
COPY --from=Build /code/out .

EXPOSE 80
ENTRYPOINT ["dotnet", "docker-build-test.dll"]
