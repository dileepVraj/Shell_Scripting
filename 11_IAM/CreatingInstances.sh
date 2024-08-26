#!/bin/bash

AMI_ID="ami-0b4f379183e5706b9" # Specify the Amazon Machine Image (AMI) ID to be used for launching the instance.
Security_Group_ID="sg-0c6b243516a699b3f" # Specify the security group ID to associate with the instance for controlling inbound and outbound traffic.

# Array of instance names for various services.
# Instances_Array=("Mongo_db" "Catalogue" "Redis" "My_SQL" "Rabbit_MQ" "User" "Cart" "Shipping" "Payment" "Dispatch" "Web")
Instances_Array=("Mongo_db" "Web" "Cart")
Domain_Name="devopsraja4523.online"
Hosted_Zone_ID="Z0143914ZQS136BBMPZ8"


# Loop through each service name in the Instances_Array
for i in "${Instances_Array[@]}"
do
    echo "instance: $i" # Print the name of the current service being processed.
    
    # Set instance type based on the service name. Specific services require different instance types.
    if [ $i == "Mongo_db" ] || [ $i == "My_SQL" ] || [ $i == "Shipping" ]; then
        Instance_Type="t3.small" # Use t3.small instance type for specified services.
    else
        Instance_Type="t2.micro" # Use t2.micro instance type for other services.
    fi

    # Run an AWS CLI command to launch an EC2 instance with the specified AMI, instance type, and security group.
    Ip_Address=$(aws ec2 run-instances --image-id $AMI_ID --instance-type $Instance_Type --security-group-ids $Security_Group_ID \
    --tag-specifications "ResourceType=instance, Tags=[{Key=Name,Value=$i}]" \
    --query 'Instances[0].PrivateIpAddress' --output text)
    
    echo $Ip_Address # Print the private IP address of the newly launched instance.

    # --image-id specifies the AMI to use for launching the instance.
    # --instance-type specifies the type of EC2 instance (e.g., t2.micro or t3.small).
    # --security-group-ids associates the instance with a specific security group to manage traffic.
    # --tag-specifications allows you to tag the instance with key-value pairs (e.g., setting the instance's name).
    # --query 'Instances[0].PrivateIpAddress' extracts the private IP address of the first instance from the result.
    # --output text formats the output of the --query option as plain text for easy readability.

    #=====================================================================================

    aws route53 change-resource-record-sets \
    --hosted-zone-id $Hosted_Zone_ID \
    --change-batch '
    {
        "Comment": "Creating a record set for congnito endpoint"
        ,"Changes": 
        [{
            "Action"    : "CREATE"
            ,"ResourceRecordSet"    : 
            {
            "Name"  : "'$i'.'$Domain_Name'"
            ,"Type" : "A"
            ,"TTL"  : 1
            ,"ResourceRecords"  : 
            [{
                "Value" : "'$Ip_Address'"
            }]

            }
        }]
    }
        '
    
done
