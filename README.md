# aspnetappfordockertest
Project ASP.NET para test de publicación en Docker

Command Line: 

```
docker run --rm -it -p 8000:80 -v [local_clone_path]\aspnetappfordockertest:/app/ -w /app/aspnetappfordockertest microsoft/dotnet:2.1-sdk dotnet watch run
```
