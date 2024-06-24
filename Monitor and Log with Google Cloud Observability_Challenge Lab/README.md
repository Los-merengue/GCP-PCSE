## ***```Monitor and Log with Google Cloud Observability_Challenge Lab```***

### Challenge Scenario

In your new role as Junior Cloud Engineer for Jooli Inc., you're expected to help manage the Cloud infrastructure components 
and support the video operations team. Common tasks include monitoring resource utilization, analyzing logs, configuring alerts, 
and reporting on any issues related to Jooli Inc.'s online services.

As you're expected to have the skills and knowledge for these tasks, step-by-step guides are not provided.

Some Jooli Inc. standards you should follow:

Create all resources in the <filled in at lab start> region and <filled in at lab start> zone, unless otherwise directed.
Naming is team-resource, e.g. an instance could be named video-webserver1.
Allocate cost effective resource sizes. Projects are monitored and excessive resource use will result in the containing 
project's termination (and possibly yours), so beware. Unless directed, use e2-medium.

### Your Challenge

On the first day of your new job, your manager gives you a series of tasks that you must complete. Good luck!

Your primary concern is a media upload function that Jooli Inc. provides. This function allows subscribers to upload 
video content to edit and transform using Jooli Inc.'s innovative range of cloud based media production tools.

The media upload function is a critical part of the service, and it is vital that Jooli Inc. is aware of any changes in the 
behavior of the users that might impact performance or cost of the services.

Your tasks today will use Cloud Operations tools to improve the company's ability to identify such changes and respond to 
them rapidly. Your manager has told you that the company is concerned that recent changes in end user behavior, combined 
with a new generation of phones and tablets, is fuelling a demand for much higher media such as 4K, and even 8K, video. 
Storage for the data is a relatively minor concern but the company wants to make sure that resource consumption by the 
Cloud Functions used for media upload and transcoding do not run into any limits or result in unexpected spikes in billing costs.

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