FROM microsoft/aspnetcore:1
LABEL Name=docker-build-test Version=0.0.1
ARG source=.
WORKDIR /app
EXPOSE 80
COPY $source .
ENTRYPOINT dotnet docker-build-test.dll
