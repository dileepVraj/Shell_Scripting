#!/bin/bash

# AMI ID for the Amazon Machine Image to be used for creating instances.
AMI_ID="ami-0b4f379183e5706b9"

# Security Group ID for the security group to be associated with the instances.
Security_Group_ID="sg-0c6b243516a699b3f"

# Array of instance names representing different services.
Instances_Array=("Mongo_db" "Catalogue" "Redis" "My_SQL" "Rabbit_MQ" "User" "Cart" "Shipping" 
"Payment" "Dispatch" "Web")

# Loop through each instance name in the Instances_Array.
for i in "${Instances_Array[@]}"
do
    # Print the current instance name being processed.
    echo "instance: $i"

    # Check if the current instance is one of the specific services that need a larger instance type.
    if [ $i == "Mongo_db" ] || [ $i == "My_SQL" ] || [ $i == "Shipping" ]; then
        # Set instance type to t3.small for these services.
        Instance_Type="t3.small"
    else
        # Set instance type to t2.micro for all other services.
        Instance_Type="t2.micro"
    fi

    # Run an AWS CLI command to launch an EC2 instance with the specified AMI, instance type, and security group.
    Ip_Address=$(aws ec2 run-instances --image-id $AMI_ID --instance-type $Instance_Type --security-group-ids $Security_Group_ID \
    --tag-specifications "ResourceType=instance, Tags=[{Key=Name,Value=$i}]" --query 'Instances[0].PrivateIpAddress' --output text)
    echo $Ip_Address
    # --image-id specifies the AMI to use.
    # --instance-type specifies the type of instance (t2.micro or t3.small).
    # --security-group-ids associates the instance with a security group.
    # --tag-specifications allows tagging the instance with a name (using the instance name from the array).
done  
