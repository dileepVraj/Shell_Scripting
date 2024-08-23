#!/bin/bash

AMI_ID="ami-0b4f379183e5706b9"
Security_Group_ID="sg-0c6b243516a699b3f"

Instances_Array=("Mongo_db","Catalogue","Redis","My_SQL","Rabbit_MQ","User","Cart","Shipping",
"Payment","Dispatch","Web")

for i in "$Instances_Array[@]"
do
    echo "instance: $i"
    if [ $i == "Mongo_db"] || [ $i == "My_SQL" ] || [ $i == "Shipping" ]; then
        Instance_Type="t3.small"
    else
        Instance_Type="t2.micro"
    fi

    aws ec2 run-instances --image-id $AMI_ID --instance-type $Instance_Type --security-group-ids 
    $Security_Group_ID --tag-specifications "ResourceType=instance, Tags=[{Key=Name,Value=$i}]"
done     