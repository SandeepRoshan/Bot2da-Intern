# Terraform EC2 and VPC Setup

This Terraform configuration creates an EC2 instance within a specified VPC and security group. The setup ensures that the instance is not accessible from the public internet by disabling the assignment of a public IP address and not allowing any inbound traffic.

## AWS Services and Components

### 1. Amazon EC2 (Elastic Compute Cloud)
Amazon EC2 provides scalable compute capacity in the cloud.

#### Components
- **EC2 Instance**
  - **AMI (Amazon Machine Image)**: The template containing the OS and software configuration.
  - **Instance Type**: Defines the hardware for the instance (default: `t2.micro`).
  - **Availability Zone**: A distinct location within an AWS region for fault tolerance.
  - **Security Groups**: Virtual firewalls for controlling traffic to and from the instance.
  - **Network Interface**: Includes a private IP address within the specified VPC.
  - **Root Block Device**: The primary storage (8 GiB in size) for the operating system.

### 2. Amazon VPC (Virtual Private Cloud)
Amazon VPC allows launching AWS resources into a virtual network that you define.

#### Components
- **Security Group**
  - **Description**: Named "Security group for blocking public access" and associated with the specified VPC.
  - **Inbound Rules**: No inbound rules, effectively blocking all incoming traffic.
  - **Outbound Rules**: Default rule allowing all outbound traffic.

## Additional Details

- **Region and Availability Zone**: Resources are created in the specified AWS region and availability zone.
- **Networking Considerations**: 
  - Instances do not have public IP addresses, ensuring they are not accessible from the internet.
  - Instances are assigned private IP addresses within the VPC.

- **Tags**: 
  - Security Group: `"example-security-group"`
  - EC2 Instance: `"example-instance"`

## Usage

- **Security**: The setup enhances security by not assigning public IPs and blocking all inbound traffic.
- **Flexibility and Scalability**: You can easily scale the setup, modify instance types, and update security group rules.
- **Cost Consideration**: Using `t2.micro` instances may fall under the AWS Free Tier, ideal for low-traffic or development scenarios.

This configuration is suitable for secure, internal applications, such as backend servers, databases, or internal tools, which do not require direct internet access.



# Terraform EC2 and VPC Setup

This Terraform configuration sets up an Amazon EC2 instance within a specified VPC and security group. The setup blocks public internet access by not assigning a public IP address and not allowing inbound traffic.

## Prerequisites

Before using this Terraform configuration, ensure you have the following:

1. **AWS Account**: An active AWS account with necessary permissions to create EC2 instances and security groups.
2. **Terraform**: Installed Terraform CLI version 0.12 or later. You can download it from [Terraform's official site](https://www.terraform.io/downloads.html).
3. **AWS CLI**: Installed and configured AWS CLI, which you can download from [AWS CLI official site](https://aws.amazon.com/cli/).
4. **IAM User Credentials**: An IAM user with access key and secret key, configured either in `~/.aws/credentials` or using environment variables (`AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`).

## How to Use

### 1. Clone the Repository

Clone this repository to your local machine:

git clone <repository-url>
cd <repository-directory>

### 2. Initialize Terraform -> Initialize the Terraform configuration. This will download the necessary provider plugins

terraform init

### 3. Plan the Infrastructure -> Generate and review an execution plan to see what resources Terraform will create, update, or destroy

terraform plan

### 4. Apply the Configuration -> Apply the configuration to create the resources

terraform apply
You will be prompted to confirm the execution. Type "yes" and press Enter.

### 2. Destroy the Infrastructure -> To delete all resources created by Terraform

terraform destroy


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

