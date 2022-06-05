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
alias vmstop="gce stop sanglevm"
alias vmstart="gce start sanglevm"

```

## ssh config for facility remote

## create ~/.ssh/config file with content like example

```

Host $yourVMname
HostName #yourVMIP
User $userNameWhenCreateVM
IdentityFile $pathToPubKey

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
