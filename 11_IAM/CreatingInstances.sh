#!/bin/bash

AMI_ID="ami-0b4f379183e5706b9" # Specify the Amazon Machine Image (AMI) ID to be used for launching the instance.
Security_Group_ID="sg-0c6b243516a699b3f" # Specify the security group ID to associate with the instance for controlling inbound and outbound traffic.

# Array of instance names for various services.
Instances_Array=("Mongo_db" "Catalogue" "Redis" "My_SQL" "Rabbit_MQ" "User" "Cart" "Shipping" "Payment" "Dispatch" "Web")

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


    # Run the AWS CLI command to change resource record sets in Route 53
aws route53 change-resource-record-sets \

# Specify the ID of the hosted zone where the DNS record will be created
--hosted-zone-id $Zone_ID \

# Define the changes to be made in a JSON format
--change-batch '
{
    # An optional comment to describe the purpose of the change batch
    "Comment": "Creating a record for cognito endpoint",

    # List of changes to apply
    "Changes": 
    [{
        # The action to be performed. In this case, we're creating a new record
        "Action": "CREATE",

        # Details of the DNS record to be created
        "ResourceRecordSet": 
        {
            # The fully qualified domain name (FQDN) for the record
            # $i and $Domain_Name are shell variables
            "Name": "'$i'.'$Domain_Name'",

            # The type of DNS record (e.g., 'A' for IPv4 address)
            "Type": "A",

            # Time to Live (TTL) in seconds. The TTL determines how long DNS resolvers should cache the record
            "TTL": 1,

            # The value of the record. For 'A' records, this is the IP address
            # $IP_ADDRESS is a shell variable containing the IP address
            "ResourceRecords": 
            [{
                "Value": "'$IP_ADDRESS'"
            }]
        }
    }]
}'
done
