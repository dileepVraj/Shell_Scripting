#!/bin/bash

# This file is will guide us with how to mount extra storage(disk space) for an ec2 instance in AWS.

# Process:

# Create disk:
    # Navigate to 'Elastic Block Storage' menu.
        # > 'Volumes'
        # Type: General Purpose SSD.
        # Size(GiB): user specific.
        # Availability zone: The same zone where ec2 instance is created.
        # Click on create button.

# Attach Volume to ec2 instance:
    # Once we create volume(disk space) we need to attach that to ec2 instance.

        # Select 'preferred(previously created volume)' 
        # Click on 'Actions' dropdown, select 'Attach volume'.
        # Click on 'Attach volume' button.

# Mount attached volume to ec2 instance:

    # Verify do created & volume is listed or not:

        # By executing 'lsblk'(list block devices) command we can detailed information about all available
        #.. block devices (e.g hard drives, SSDs, USB drives, partitions) on our system, including their
        #.. size, types and mount points.

    # Create a file system:
        # After you create and attach a new volume to an EC2 instance, we typically need to create a 
        #..file system on that volume before you can use it to store files.

            # What is a file system?

                # A file system is a method used by operating systems to organize, manage, and store
                # files on a storage device like a hard drive, SSD, or in this case,, an attached 
                # ..volume on an EC2 instance.

                    # Example:
                    # Think of a file system as a filing cabinet:
                    # The Filing Cabinet (Storage Volume): This is like your newly attached 
                    #..volume—it's empty and can store information.
                    # Folders and Labels (File System): Before you can start putting documents (files) 
                    #..in the cabinet, you need to create folders and labels to organize everything.
                    # This is what a file system does—it organizes the data and helps the operating 
                    # ..system know where to find things.

                    # Without a file system, your storage volume would be like a cabinet where you 
                    # ..just throw all the papers in without any organization—you wouldn’t be able to 
                    # ..easily find or manage anything.

            # How to create a file system?
                # Once you attached volume to your EC2 instance, you would typically use a command like 
                # ..mkfs (make filesystem) to create the file system.

                # For example, if your new volume is attached as /dev/xvdf, you might create an ext4 
                # ..file system on it with:

                # Command: sudo mkfs -t ext4 /dev/xvdf

                    # Explaination:
                        # sudo: This command runs with superuser (root) privileges.
                        # ..Creating a file system requires administrative rights because it changes 
                        # the structure of the storage device.

                        # mkfs: Short for "make filesystem". This command is used to create a file 
                        # ..system on a storage device.

                        # -t ext4: Specifies the type of file system to create.
                        # -t: Stands for "type". It's an option that allows you to specify the type of 
                        #..file system you want to create.

                        # ext4: A common Linux file system type (stands for "Fourth Extended Filesystem").
                        # It’s known for its reliability and efficiency in handling large amounts of data.

                        # /dev/xvdf/: This is the device name for the attached volume.
                        # /dev/: This is the directory where devices are located in Linux.
                        # /xvdf/: The specific device name assigned to your attached volume.
    
    # Mounting the Volume:
        # After creating the file system, you need to mount the volume to a directory so that you can 
        # ..use it to store and retrieve files.

        # Command: sudo mount /dev/xvdf /mnt/mydisk
            # Explanation:
            # mount:  This command is used to attach a file system on a device to a directory in the 
            # file system hierarchy so that the data on the device can be accessed.

            # /dev/xvdf/: The device you want to mount (the one you just created the file system on).

            # /mnt/mydisk/: The directory where you want to mount the device.
            # This is a directory that you create or choose where the volume’s file system will be 
            # ..accessible.

            # /mnt/:A common directory used for temporarily mounting storage devices in Linux.
            # mydisk: The name of the directory where you’re mounting the volume.

    # Updating '/etc/fstab'(Optional but recommended):
        # The /etc/fstab file in Linux controls the automatic mounting of file systems at boot time. 
        # Adding an entry here ensures that your volume is automatically mounted whenever the instance 
        # is rebooted.

        # Command: echo '/dev/xvdf /mnt/mydisk ext4 defaults,nofail 0 2' | sudo tee -a /etc/fstab

            # Explaination:
                # echo: This command outputs the string that follows it.
                # '/dev/xvdf /mnt/mydisk ext4 defaults,nofail 0 2': This is the entry you are adding to 
                # the /etc/fstab file. 
                
                # Let's break it down:

                    # /dev/xvdf/: The device we are mounting.

                    # /mnt/mydisk: The directory where it will be mounted.

                    # ext4: The file system type.

                    # defaults: A set of default mount options (like read/write permissions).

                    # nofail: Ensures that the system doesn’t fail to boot if this device isn’t 
                    # ..available during boot time.

                    # 0: his field is used by the dump command to determine if the filesystem needs to 
                    # ..be backed up. 0 means no backup.

                    # 2: Determines the order in which the fsck (filesystem check) utility should check 
                    # ..the file systems at boot time. 1 is reserved for the root filesystem, and 
                    # ..other file systems should use 2.

                    # |: This is a pipe, which takes the output from the echo command and passes it as 
                    # ..input to the next command (tee).

                    # sudo tee -a /etc/fstab: This command appends (-a) the text to the /etc/fstab file.

                    # tee: A command that reads from the standard input and writes to both the standard 
                    # ..output and a file.

                    # -a: Appends the output to the file instead of overwriting it.

                    # /etc/fstab: The file where the entry is added.
    
    # Verifying the mount:
        # Finally, we can verify that the volume is properly mounted and check the available space

        # Command: df -h


# Unmount the Device:

    # To unmount the device, you can use the 'unmount' command followed by the mount point or the device name.

    # Command: sudo unmount <mount point>

    # Alternatively, if you prefer using device name:

    # Command: sudo unmount /dev/xvdd

# Delete the volume in AWS management console.

    # Go to the EC2 Dashboard: 
    #  Log in to the AWS Management Console and navigate to the EC2 dashboard.

    # Select "Volumes":
    #  Under the "Elastic Block Store" section in the left-hand menu, click on "Volumes."

    # Find and Select the Volume:
    #  Locate the volume you want to delete. It should show as "available" if it's properly unmounted.

    # Delete the Volume:
    #  Right-click the volume and choose "Delete Volume," then confirm the deletion.















        



    

