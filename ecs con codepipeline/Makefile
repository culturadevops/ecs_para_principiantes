ruta=$(shell pwd)
init:
	docker run -it -v ${ruta}:/tmp  \
	-e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}  \
	-e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}  \
	terraform init
initrecnfigure:
	docker run -it -v ${ruta}:/tmp  \
	-e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}  \
	-e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}  \
	terraform init -reconfigure

plan:
	docker run -it -v ${ruta}:/tmp  \
	-e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}  \
	-e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
	 terraform plan -var-file="testing.tfvars"
apply:
	docker run -it -v ${ruta}:/tmp \
	-e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \ 
	-e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}  \ 
	terraform apply -var-file="testing.tfvars"
destroy:
	docker run -it -v ${ruta}:/tmp \ 
	-e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \ 
	-e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} 
	terraform destroy  -var-file="testing.tfvars"

config:
	export AWS_ACCESS_KEY_ID=AKIAYFQTFKR6NOYROAHK;
	export AWS_SECRET_ACCESS_KEY=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
