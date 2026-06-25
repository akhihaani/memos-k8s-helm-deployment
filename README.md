Set-Up:

- Have docker daemon open
- Have helm and kind installed

```
kind creater cluster
kind load docker-image memos:local
helm install memos ./helm/memos-chart
kubectl port-forward service/memos 8081:80
```

Now you can visit https://localhost:8081