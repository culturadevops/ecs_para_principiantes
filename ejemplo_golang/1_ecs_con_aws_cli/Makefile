CLUSTER_NAME=minuevoclusterdelinux
AWS_REGION=us-east-1
SERVICE_NAME=minuevoservice_cli
APPNAME=mi_app_por_cli
IMAGEN_NAME=
REPO_NAME=
creardocker:
	docker build -t ${IMAGEN_NAME}
	docker tag ${IMAGEN_NAME} ${REPO_NAME}"
subirdocker:
	docker push ${REPO_NAME}"
task:
	aws ecs register-task-definition --region ${AWS_REGION} \
    --cli-input-json file://task-definition-ec2.json

createService:
	aws ecs create-service \
    --cluster ${CLUSTER_NAME} \
    --service-name ${SERVICE_NAME} \
    --task-definition ${APPNAME} \
    --desired-count 1  \
    --launch-type EC2 \

updateService:
	aws ecs update-service --cluster ${CLUSTER_NAME} \
    --desired-count 0  \
    --service ${SERVICE_NAME} \
    --region ${AWS_REGION}  \
    --task-definition ${APPNAME}        


createRole:
	aws iam create-role --role-name ecsTaskExecutionRole3 \
    --assume-role-policy-document file://ecs-tasks-trust-policy.json

	aws iam attach-role-policy --role-name ecsTaskExecutionRole3 \
    --policy-arn arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy


  #debido a que culturadevops te quiere te dejo un extra ;)
  #aws iam attach-role-policy --role-name <nombre de tu rol nuevo> --cli-input-json file://
  #aws iam put-role-policy --role-name <nombre de tu rol nuevo> --policy-name Permissions-Policy --policy-document file://