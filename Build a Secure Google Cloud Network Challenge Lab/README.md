## ***```Build a Secure Google Cloud Network: Challenge Lab```***

### Challenge Scenario

You are a security consultant brought in by Jeff, who owns a small local company, to help him with his very successful website (juiceshop). Jeff is new to Google Cloud and had his neighbour's son set up the initial site. The neighbour's son has since had to leave for college, but before leaving, he made sure the site was running.


### Your Challenge

You need to create the appropriate security configuration for Jeff's site. Your first challenge is to set up firewall rules and virtual machine tags. You also need to ensure that SSH is only available to the bastion via IAP.

For the firewall rules, make sure that:

- The bastion host does not have a public IP address.
- You can only SSH to the bastion and only via IAP.
- You can only SSH to juice-shop via the bastion.
- Only HTTP is open to the world for juice-shop.
Tips and tricks:

- Pay close attention to the network tags and the associated VPC firewall rules.
- Be specific and limit the size of the VPC firewall rule source ranges.
- Overly permissive permissions will not be marked correct.


## Solution Implementation

### Export all the values carefully

The solution to this problem I have been able to automate the process in the [script](./secureGCP.sh) and all that has to 
done is just to run the script in the cloud shell environment. When you begin running the script, you may be asked about 
the parameters that will be issued to you by Google, fill it and run your script.

###
###

### ***NOW JUST COPY THE CODE AND PASTE ON YOUR CLOUD SHELL***
###
###

```bash 
- curl -LO https://raw.githubusercontent.com/Los-merengue/GCP-PCSE/main/Implement%20Cloud%20Security%20Fundamentals%20on%20Google%20Cloud%EF%80%BA%20Challenge%20Lab/cloud-security.sh
- sudo chmod +x cloud-security.sh
- ./cloud-security.sh

```

### Congratulations !!!