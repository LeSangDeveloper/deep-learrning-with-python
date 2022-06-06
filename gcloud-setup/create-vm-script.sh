#! /bin/bash

# create firewall rules to allow specific ports
gcloud compute firewall-rules create http-node --allow tcp:5000-65000 --source-tags=email-server --source-ranges=0.0.0.0/0 --description="allow node http ports"

gcloud compute machine-types list --zone asia-northeast1-b

gcloud compute firewall-rules create http-node --allow tcp:6000-9000 --source-tags=$vmName --source-ranges=0.0.0.0/0 --description="allow jupyter notebook http ports"

# provisioning new Dev VM
# new high CPU instance template at Đài Loan - Taiwan - asia-east1
# 8vCPU - 32GB RAM
# add ssh public key for remote after instance created
gce create $yourVMname --project=$yourProjectId --zone=asia-east1-b --machine-type=n2-standard-8 --network-interface=network-tier=PREMIUM,subnet=default \
 --metadata=ssh-keys=$yourName:ssh-rsa\ AAAAB3NzaC1yc2EAAAADAQABAAABAQC0xWy7Lb/L9eCEWYPQ1HL2axmgtjZdDizCTaKHQV6N6HppuosKriy7w5Sr7w1BTnCJPDr1qTyynMJBv9N6IdTV\+TPDXGBLFH8bqA5O7IlllFwWbB5\+zL\+9SgTeBiXTEXVikxE399x8hNV8pQGBXyOpKsGCa\+YrQ6p7zCuO2WRAwNwyWlMeI9650NqFAyFQipLJYC6Sqjq1vOEGUTeprDoWL6rOvckIOYxtk9TbRBtWCQ9hqVQhJZQeutThWdX84NjkcjMbFzvf4k1THMQbBpfLFiBc9mxy8mFyG82l4DmX3Xrnxp17G7MUsxUppFpIzEKC64o34FkaBzmYxaxxTGTl\ yourName \
 --maintenance-policy=MIGRATE \
 --service-account=212211154153-compute@developer.gserviceaccount.com \
 --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
 --min-cpu-platform=Intel\ Cascade\ Lake --tags=http-node,http-server,https-server \
 --create-disk=auto-delete=yes,boot=yes,device-name=email-server-disk,image=projects/debian-cloud/global/images/debian-10-buster-v20220118,mode=rw,size=100,type=projects/memo-340322/zones/asia-east1-b/diskTypes/pd-ssd \
 --no-shielded-secure-boot --shielded-vtpm \
 --shielded-integrity-monitoring --reservation-affinity=any

# hongkong
# 8vCPU - 32GB RAM
# Monthly estimate
# $350
--zone=asia-east2-a --machine-type=c2-standard-8

gcloud compute instances create $yourVMname --project=yourProjectId --zone=asia-east2-b --machine-type=c2-standard-8 --network-interface=network-tier=PREMIUM,subnet=default --metadata=ssh-keys=$yourName:ssh-rsa\ AAAAB3NzaC1yc2EAAAADAQABAAABAQC0xWy7Lb/L9eCEWYPQ1HL2axmgtjZdDizCTaKHQV6N6HppuosKriy7w5Sr7w1BTnCJPDr1qTyynMJBv9N6IdTV\+TPDXGBLFH8bqA5O7IlllFwWbB5\+zL\+9SgTeBiXTEXVikxE399x8hNV8pQGBXyOpKsGCa\+YrQ6p7zCuO2WRAwNwyWlMeI9650NqFAyFQipLJYC6Sqjq1vOEGUTeprDoWL6rOvckIOYxtk9TbRBtWCQ9hqVQhJZQeutThWdX84NjkcjMbFzvf4k1THMQbBpfLFiBc9mxy8mFyG82l4DmX3Xrnxp17G7MUsxUppFpIzEKC64o34FkaBzmYxaxxTGTl\ $yourName --maintenance-policy=MIGRATE --service-account=212211154153-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --tags=http-node,http-server,https-server --create-disk=auto-delete=yes,boot=yes,device-name=lamlevm,image=projects/debian-cloud/global/images/debian-10-buster-v20220118,mode=rw,size=100,type=projects/memo-340322/zones/asia-east2-b/diskTypes/pd-ssd --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --reservation-affinity=any 
