CI/CD Project with Terraform, EKS, and GitHub Actions

This repository implements a Continuous Integration and Continuous Deployment (CI/CD) process using Terraform to provision resources in Amazon EKS (Elastic Kubernetes Service). The workflow is automated through GitHub Actions, ensuring efficient and reliable delivery of both infrastructure and applications.

To ensure code integrity and secure deployment, the branch strategy is implemented in GitHub Actions. This prevents direct pushes to the main branch, ensuring that all changes are made through pull requests that require review and approval before merging.

GitHub Actions Pipeline - terraform.yml
Pipeline Triggers
The pipeline is triggered on each push to the main and stage branches in the terraform/ folder.

Environment Variables
Secure environment variables are used to manage AWS credentials, Terraform state bucket name, AWS region, and EKS cluster name.

Pipeline Jobs - Terraform
The terraform job runs on an Ubuntu machine and performs the following tasks:

AWS Configuration: Sets up AWS and kubectl credentials.
kubectl Installation: Downloads and configures kubectl.
Terraform Configuration: Installs and configures Terraform.
Terraform Init: Initializes Terraform with the S3 backend for state storage.
Terraform Format: Verifies and formats Terraform files.
Terraform Validate: Validates the syntax and structure of Terraform files.
Terraform Plan: Generates a Terraform execution plan.
Terraform Apply: Applies changes if the plan is successful.

Terraform Files
backend.tf: Configures the Terraform backend to store state in an S3 bucket, ensuring secure and centralized state management.
cluster.tf: Defines a node group for the EKS cluster with specific configurations, including instance types and node group capacity.
efs.tf: Creates an Elastic File System (EFS) in AWS, ensuring persistent and shared storage for deployed applications.
s3bucket.tf: Creates an S3 bucket to store Terraform state, establishing the necessary infrastructure for centralized state management.
variables.tf: Defines variables used in Terraform files, facilitating customization and configuration reuse.
vpc.tf: Configures the Virtual Private Cloud (VPC) for the EKS cluster, establishing the necessary network infrastructure for cluster applications.
applydeployment.tf: Defines additional resources, such as EKS nodes and resources to apply in the Kubernetes cluster, facilitating infrastructure expansion and customization.

Terraform Folder
Contains Terraform files that configure infrastructure in AWS.

EKS Folder
Contains YAML files for deploying applications in the EKS cluster.

YAML Files (deployment1.yml, deployment2.yml, deployment3.yml)
Deployment configurations for services in the EKS cluster, specifying the number of replicas and container configurations.

YAML Files (pvc.yml, pv.yml)
Definitions for PersistentVolumeClaims and PersistentVolumes for persistent storage in the cluster.

servicelb.yml
LoadBalancer service configuration to expose Backend Services externally, allowing external access to deployed Backend Services.


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Proyecto de CI/CD con Terraform, EKS y GitHub Actions

Este repositorio implementa un proceso de Integración Continua y Despliegue Continuo (CI/CD) utilizando Terraform para aprovisionar recursos en Amazon EKS (Elastic Kubernetes Service). El flujo de trabajo se automatiza mediante GitHub Actions, garantizando una entrega eficiente y fiable de la infraestrcutura y aplicaciones.

Para garantizar la integridad del código y un despliegue seguro, se implementa la estrategia de ramas en GitHub Actions. Esto impide los pushes directos a la rama main, asegurando que todos los cambios se realicen a través de pull requests que requieren revisión y aprobación antes de la fusión.

Pipeline de GitHub Actions - terraform.yml Disparadores del Pipeline El pipeline se activa en cada push a las ramas main y stage en la carpeta terraform/.

Variables de Entorno Se utilizan variables de entorno seguras para gestionar las credenciales de AWS, el nombre del bucket de estado de Terraform, la región de AWS y el nombre del clúster EKS.

Trabajos del Pipeline Terraform El trabajo terraform se ejecuta en una máquina Ubuntu y realiza las siguientes tareas:

Configuración AWS: Establece las credenciales de AWS y kubectl. Instalación kubectl: Descarga y configura kubectl. Configuración Terraform: Instala y configura Terraform. Terraform Init: Inicializa Terraform con el backend S3 para almacenar el estado. Terraform Format: Verifica y formatea los archivos Terraform. Terraform Validate: Valida la sintaxis y estructura de los archivos Terraform. Terraform Plan: Genera un plan de ejecución de Terraform. Terraform Apply: Aplica los cambios si el plan es exitoso.

Archivos Terraform backend.tf Configura el backend de Terraform para almacenar el estado en un bucket de S3. Este archivo garantiza una gestión segura y centralizada del estado de Terraform.

cluster.tf Define un grupo de nodos para el clúster EKS con configuraciones específicas. Aquí se especifican los tipos de instancias y la capacidad del grupo de nodos.

efs.tf Crea un sistema de archivos elástico (EFS) en AWS. Este archivo garantiza el almacenamiento persistente y compartido para las aplicaciones desplegadas.

s3bucket.tf Crea un bucket de S3 para almacenar el estado de Terraform. Este archivo establece la infraestructura necesaria para la gestión centralizada del estado de Terraform.

variables.tf Define variables utilizadas en los archivos Terraform. Esto facilita la personalización y reutilización de configuraciones.

vpc.tf Configura la red virtual privada (VPC) para el clúster EKS. Este archivo establece la infraestructura de red necesaria para las aplicaciones en el clúster.

applydeployment.tf Define recursos adicionales, como nodos EKS y recursos para aplicar en el clúster Kubernetes. Facilita la expansión y personalización de la infraestructura.

Carpeta Terraform Contiene archivos Terraform que configuran la infraestructura en AWS.

Carpeta EKS Contiene archivos YAML para desplegar aplicaciones en el clúster EKS.

Archivos YAML deployment1.yml, deployment2.yml, deployment3.yml: Configuraciones de implementación para servicios en el clúster EKS. Especifican la cantidad de replicas y configuraciones de contenedores.

pvc.yml, pv.yml: Definiciones de reclamación y volumen persistentes para almacenamiento persistente en el clúster.

servicelb.yml: Configuración del servicio LoadBalancer para exponer los BE. Permite el acceso externo a los MS de BE desplegados.

deployment1.yml, deployment2.yml, deployment3.yml

Contienen las especificaciones de despliegue para servicios en el clúster EKS. Se definen detalles como:

Replicas: Establecen la cantidad de instancias del servicio que se ejecutarán para garantizar la disponibilidad y la escalabilidad.

Contenedores: Configuran las opciones de contenedor, como la imagen a utilizar, los puertos expuestos y los volúmenes asociados.

PVC: Define cómo y cuánto espacio de almacenamiento persistente necesita una aplicación, en este caso 10Gi.

PV: Especifica la implementación física de ese espacio de almacenamiento, detallando su capacidad y tipo.

servicelb.yml Se encuentra la configuración del servicio LoadBalancer, el cual permitirá el acceso externo a los MS desplegados en el clúster EKS.
