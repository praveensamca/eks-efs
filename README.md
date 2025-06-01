# eks-efs

## Claim -> praveensams16@gmail.com
---

# 🚀 AWS Infrastructure Deployment: VPC, EKS, and EFS Integration

This repository offers a Terraform-based solution to deploy a robust AWS infrastructure comprising:

* **Amazon VPC**: A customizable Virtual Private Cloud with defined CIDR blocks.
* **Amazon EKS**: A managed Kubernetes cluster with tailored node group configurations.
* **Amazon EFS**: A scalable, shared file system integrated with Kubernetes via the EFS CSI driver.

## 🧱 Infrastructure Components

### 1. **Virtual Private Cloud (VPC)**

* **Custom CIDR Block**: Define your own IP address range for the VPC.
* **Subnets**: Creation of public and private subnets to segregate resources.
* **Internet Gateway & NAT Gateway**: Facilitates internet access for public subnets and controlled outbound traffic for private subnets.
* **Route Tables**: Configured to manage traffic flow between subnets and gateways.

### 2. **Elastic Kubernetes Service (EKS)**

* **Cluster Setup**: Deployment of an EKS cluster with specified Kubernetes version.
* **Node Groups**: Configuration of managed node groups with desired instance types and scaling policies.
* **IAM Roles**: Establishes necessary IAM roles and policies for EKS and worker nodes.
* **Security Groups**: Defines security groups to control inbound and outbound traffic to the cluster.

### 3. **Elastic File System (EFS)**

* **File System Creation**: Provisioning of an EFS file system for shared storage needs.
* **Mount Targets**: Setup of mount targets in each availability zone for high availability.
* **Security Groups**: Configured to allow NFS traffic between EFS and EKS nodes.

### 4. **Kubernetes Integration**

* **EFS CSI Driver**: Deployment of the EFS Container Storage Interface driver to enable Kubernetes pods to use EFS.
* **Persistent Volumes (PV) and Persistent Volume Claims (PVC)**: Definitions to allow pods to claim storage from EFS.
* **Storage Class**: Custom storage class to manage dynamic provisioning of EFS volumes.

## 📂 Repository Structure

```
.
├── efs.tf               # EFS file system and mount targets
├── eks.tf               # EKS cluster and node group configurations
├── eks-addon.tf         # Additional EKS components (e.g., CoreDNS, kube-proxy)
├── irsa.tf              # IAM Roles for Service Accounts (IRSA)
├── output.tf            # Outputs for Terraform
├── pods-2.yaml          # Sample pod deployment using EFS
├── pods.yml             # Another sample pod deployment
├── pv.yaml              # Persistent Volume definition
├── pvc.yml              # Persistent Volume Claim definition
├── role.tf              # IAM role definitions
├── sc.yaml              # Storage Class for EFS
├── security.tf          # Security group configurations
├── variable.tf          # Variable declarations
├── variable.tfvars      # Variable values
└── README.md            # Project documentation
```

## ⚙️ Prerequisites

* **AWS CLI**: Configured with appropriate credentials.
* **Terraform**: Version 1.0 or higher.
* **kubectl**: For interacting with the Kubernetes cluster.
* **Helm**: Optional, for managing Kubernetes applications.

## 🚀 Deployment Steps

1. **Clone the Repository**

   ```bash
   git clone https://github.com/praveensamca/eks-efs.git
   cd eks-efs
   ```

2. **Initialize Terraform**

   ```bash
   terraform init
   ```

3. **Review and Modify Variables**

   * Edit `variable.tfvars` to customize values like region, VPC CIDR, EKS cluster name, etc.

4. **Apply Terraform Configuration**

   ```bash
   terraform apply -var-file="variable.tfvars"
   ```

5. **Update kubeconfig**

   ```bash
   aws eks --region <region> update-kubeconfig --name <cluster_name>
   ```

6. **Deploy EFS CSI Driver and Kubernetes Resources**

   ```bash
   kubectl apply -f sc.yaml
   kubectl apply -f pv.yaml
   kubectl apply -f pvc.yml
   kubectl apply -f pods.yml
   ```

## 🧪 Testing the Setup

* **Verify Pod Deployment**

  ```bash
  kubectl get pods
  ```

* **Check Persistent Volume Claims**

  ```bash
  kubectl get pvc
  ```

* **Inspect Mounted Volumes**

  ```bash
  kubectl exec -it <pod-name> -- df -h
  ```

## 🧹 Cleanup

To destroy all resources created by Terraform:

```bash
terraform destroy -var-file="variable.tfvars"
```

## 📘 Additional Information

* **IAM Roles for Service Accounts (IRSA)**: Ensures that Kubernetes service accounts have fine-grained permissions to AWS resources.
* **Security Best Practices**: Resources are deployed in private subnets with controlled access via security groups and IAM policies.
* **Scalability**: The infrastructure supports scaling of EKS nodes and EFS storage as per workload demands.

## 📄 License

This project is licensed under the MIT License.

---

Feel free to customize this `README.md` further to match your specific use case or organizational standards.
