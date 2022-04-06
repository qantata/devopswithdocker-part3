Before (using node:16 and golang:1.16):
```
$ docker image ls | grep material-applications_
material-applications_frontend   latest    46ede2cdfedd   5 hours ago     1.22GB
material-applications_backend    latest    35c2f5f4ea7d   5 hours ago     1.07GB
```

After (using node:16-alpine and golang:1.16-alpine):
```
$ docker image ls | grep material-applications_
material-applications_frontend   latest        a1e65f1c6b7f   2 minutes ago    420MB
material-applications_backend    latest        68e74be6fafa   3 minutes ago    447MB
```
