## setup gcloud CLI for MacOS


```
    brew install --cask google-cloud-sdk
```

## login gcloud by email which is invited to GCP project


```
    gcloud auth login
```

## set your project as default project


```
    gcloud config set project $yourProject
```


## create new Dev VM by reference create-new-vm.sh


## provisioning new Dev VM by reference vm-provisioning-script.sh


## autopass.sh is scripting for auto input ssh passphase


## alias set for gcloud compute instance

```

alias gce="gcloud compute instances"
alias vmlist="gce list"
alias vmstop="gce stop lamlevm"
alias vmstart="gce start lamlevm"

```

## ssh config for facility remote

## create ~/.ssh/config file with content like example

```

Host lamlevm
HostName 34.81.69.95
User lucas_nguyen
IdentityFile ~/.ssh/lephamngoclam.pub

```

## start & monitor VM by command

```
    vmstart
    vmlist
```

## setup VS Code remote GCP VM:

    install Remote - SSH plugin
    command + shift + p => Remote-SSH: Connect to Host => choose config file => pick lamlevm

## done - voila - enjoy HIGH CPU remote VM for coding :D :D :D



# !!! IMPORTANT - REMEMBER TO STOP VM AFTER your coding session because VM hour price so fucking expensive =]]]]

```
    vmstop
    vmlist
```



TERMINATED VM STATUS example

```

NAME          ZONE          MACHINE_TYPE   PREEMPTIBLE  INTERNAL_IP  EXTERNAL_IP  STATUS
email-server  asia-east1-b  n2-standard-8               10.140.0.3   34.81.69.95  TERMINATED

```
