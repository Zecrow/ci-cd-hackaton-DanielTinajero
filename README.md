🚀 EC2 Instance Deployment with Terraform & GitHub Actions
By Daniel Tinajero

Este proyecto automatiza el despliegue de una instancia EC2 en AWS utilizando Terraform y GitHub Actions, permitiendo lanzar infraestructura bajo demanda desde un workflow.

📦 Tecnologías utilizadas
Terraform: Infraestructura como código (IaC)
GitHub Actions: Automatización de CI/CD
AWS EC2: Servicio de cómputo en la nube
Amazon Linux 2: AMI base para la instancia
⚙️ ¿Qué hace este proyecto?
Busca la VPC por nombre (Aplication-Vpc por defecto).
Crea una subnet pública en la zona de disponibilidad a de la región seleccionada.
Lanza una instancia EC2 t2.micro con Amazon Linux 2.
Asigna una IP pública para que puedas acceder a la instancia desde tu navegador.
🚀 Cómo desplegar
1. Configura tus secretos en GitHub
En tu repositorio, ve a Settings > Secrets and variables > Actions y agrega:

AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
2. Ejecuta el workflow manualmente
Desde la pestaña Actions en GitHub:

Selecciona el workflow EC2 INSTANCE BY DANIEL TINAJERO.
Haz clic en Run workflow.
Ingresa:
region: por ejemplo, us-east-1
vpc: nombre de la VPC (por defecto: Aplication-Vpc)
3. Accede a la instancia
Una vez desplegada, puedes obtener la IP pública desde la consola de AWS y acceder vía:

https://54.152.36.159/   (DE MOMENTO DETUVE LA INSTANCIA)


📁 Estructura del proyecto
.
├── .github/
│   └── workflows/
│       └── deploy.yml       # Workflow de GitHub Actions
├── main.tf                  # Infraestructura con Terraform
├── variables.tf             # Variables definidas (si aplica)
└── README.md                # Este archivo
🧠 Notas adicionales
La subnet se crea con el CIDR 10.0.3.0/24. Asegúrate de que no haya conflictos en tu VPC.
La instancia no instala software adicional por defecto. Puedes agregar un user_data para automatizarlo.
