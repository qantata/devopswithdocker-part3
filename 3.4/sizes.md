Before:
```
docker image ls | grep material-applications_
material-applications_frontend   latest    46ede2cdfedd   46 minutes ago   1.22GB
material-applications_backend    latest    35c2f5f4ea7d   48 minutes ago   1.07GB
```

After:
```
$ docker image ls | grep material-applications_
material-applications_backend    latest    b81d4a44ecd3   22 seconds ago      23.9MB
material-applications_frontend   latest    26a6c473b04f   12 minutes ago      534MB
```
