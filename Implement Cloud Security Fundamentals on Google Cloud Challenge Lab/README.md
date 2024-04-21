## ***```Implement Cloud Security Fundamentals on Google Cloud: Challenge Lab```***

### Challenge Scenario

'''bash
You have started a new role as a junior member of the security team for the Orca team in Jooli Inc. Your team is responsible for ensuring the security of the Cloud infrastructure and services that the company's applications depend on.

You are expected to have the skills and knowledge for these tasks, so don't expect step-by-step guides to be provided.
'''

### Your Challenge
'''bash
You have been asked to deploy, configure, and test a new Kubernetes Engine cluster that will be used for application development and pipeline testing by the Orca development team.

As per the organization's security standards you must ensure that the new Kubernetes Engine cluster is built according to the organization's most recent security standards and thereby must comply with the following:

- The cluster must be deployed using a dedicated service account configured with the least privileges required.
- The cluster must be deployed as a Kubernetes Engine private cluster, with the public endpoint disabled, and the master authorized network set to include only the ip-address of the Orca group's management jumphost.
- The Kubernetes Engine private cluster must be deployed to the orca-build-subnet in the Orca Build VPC.
'''

### Export all the values carefully

```bash
export INSTANCE_NAME=

export ZONE=

export PORT=

export FIREWALL_NAME=
```
###
###

### ***NOW JUST COPY THE CODE AND PASTE ON YOUR CLOUD SHELL***
###
###

```bash 
curl -LO https://raw.githubusercontent.com/Los-merengue/GCP-PCSE/main/QwikLabs-Skill-Badge-Challenge/Implement%20Load%20Balancing%20on%20Compute%20Engine%EF%80%BA%20Challenge%20Lab/load-balancing.sh
sudo chmod +x load-balancing.sh
./load-balancing.sh

### Congratulations !!!