# HA Mongo with bitnami mongo images

This is a repo showing an example configuration (for docker compose and helm) to run a HA production mongo setup.

# docker-compose

Make sure you have `docker` and `docker-compose` installed.

Start with `./reset.sh`.

To test everything is working make sure you can connect with:

`docker-compose exec mongodb-primary mongo sessionstack -u sessionstack -p test`

`docker-compose exec mongodb-primary mongo admin -u root -p test`

`docker-compose exec mongodb-secondary mongo sessionstack -u sessionstack -p test`

`docker-compose exec mongodb-arbiter mongo`

# helm

Make sure you have a running kubernetes cluster you can test this on. For local testing you can use `minikube` ([here](https://docs.bitnami.com/kubernetes/get-started-kubernetes/) is a nice guide).

Once you have `helm`,  `kubectl` and `minikube` run `helm install --name mongodb-main -f ./values.yml stable/mongodb`

Check your k8s dashboard (`minikube dashboard` to start it in `minikube`) that all the pods for mongo are running.

To test everything is working make sure you can connect with:

`kubectl exec -it mongodb-main-primary-0 -- mongo sessionstack -u sessionstack -p test`

`kubectl exec -it mongodb-main-primary-0 -- mongo admin -u root -p test`

`kubectl exec -it mongodb-main-secondary-0 -- mongo sessionstack -u sessionstack -p test`

`kubectl exec -it mongodb-main-arbiter-0 -- mongo`

```
diff <(cat ./values.yml) <(curl -s https://raw.githubusercontent.com/helm/charts/master/stable/mongodb/values.yaml)
1d0
< ---
21c20
<   tag: 3.6.8
---
>   tag: 4.0.9
48c47
< mongodbRootPassword: test
---
> # mongodbRootPassword:
53,55c52,54
< mongodbUsername: sessionstack
< mongodbPassword: test
< mongodbDatabase: sessionstack
---
> # mongodbUsername: username
> # mongodbPassword: password
> # mongodbDatabase: database
118c117
<   enabled: true
---
>   enabled: false
123c122
<   name: sessionstack-main
---
>   name: rs0
127c126
<   key: replicasetkeypass
---
>   # key: key
```
