ruta=$(shell pwd)
init:
	terraform init
plan:
	terraform plan -var-file="testing.tfvars"
apply:
	terraform apply -var-file="testing.tfvars"
detroy:
	terraform destroy  -var-file="testing.tfvars"


	
docker_init:
	docker run -it -v ${ruta}:/tmp  \
	-e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}  \
	-e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}  \
	terraform init
docker_initrecnfigure:
	docker run -it -v ${ruta}:/tmp  \
	-e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}  \
	-e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}  \
	terraform init -reconfigure

docker_plan:
	docker run -it -v ${ruta}:/tmp  \
	-e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}  \
	-e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
	 terraform plan -var-file="testing.tfvars"
docker_apply:
	docker run -it -v ${ruta}:/tmp \
	-e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \ 
	-e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}  \ 
	terraform apply -var-file="testing.tfvars"
docker_destroy:
	docker run -it -v ${ruta}:/tmp \ 
	-e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \ 
	-e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} 
	terraform destroy  -var-file="testing.tfvars"

config:
	export AWS_ACCESS_KEY_ID=;
	export AWS_SECRET_ACCESS_KEY=
