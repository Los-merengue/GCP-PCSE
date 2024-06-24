## ***```Monitor and Log with Google Cloud Observability_Challenge Lab```***

### Export all the values carefully

```bash
export METRICS_NAME=

export ALERT=
```
###
###

### ***NOW JUST COPY THE CODE AND PASTE ON YOUR CLOUD SHELL***
###
###

```bash 
curl -LO https://raw.githubusercontent.com/Los-merengue/GCP-PCSE/main/Monitor%20and%20Log%20with%20Google%20Cloud%20Observability_Challenge%20Lab/Monitor.sh
sudo chmod +x Monitor.sh
./Monitor.sh
```

```bash
gcloud alpha monitoring policies create --policy-from-file="app-engine-error-percent-policy.json"
```

### Lab might task 10 - 15 mintues to updated the score so don't worry!

[![Screenshot-2024-03-25-at-7-47-33-PM.png](https://i.postimg.cc/Vk2hdZfK/Screenshot-2024-03-25-at-7-47-33-PM.png)](https://postimg.cc/zyS7QjRh)


### Congratulations !!!