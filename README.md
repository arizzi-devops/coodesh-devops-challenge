Infelizmente tive contratempos e nao consegui concluir com excelente.

Basicamente crie uma estrutura simples com um backend compartilhado na S3.
O terraform apply esta comentado na pipeline.

O ideal dar o apply apenas na pipe master ou ainda melhor apenas com execucao manual.

E um monitoramento para conferir o status da aplicacao.


### Readme do Repositório
# coodesh-devops-challenge

Repositorio criado para o desafio DevOps Coodesh.

### tech stack:
Docker, terraform, GitHub, GitHub Action, EC2, VPC, S3.


### Instrucoes:
clonar o repositorio:
```bash
git clone <repo_url>
```

Crie um arquivo .env as variaveis:

```
echo "AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY_ID>
AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY>
AWS_REGION=<AWS_REGION>" > .env
```

Feito isso, inicie o docker, execute 

```bash
docker run -it --rm -v $(pwd):/app -w /app/tf-project --entrypoint sh --env-file $(pwd)/.env hashicorp/terraform
terraform init -backend=true -backend-config="config/local/backend.hcl"
terraform plan -var-file=config/local/terraform.tfvars
```
ecnologias usadas
- Como instalar e usar o projeto (instruções)
- Não esqueça o [.gitignore](https://www.toptal.com/developers/gitignore)
- Se está usando github pessoal, referencie que é um challenge by coodesh:  

>  This is a challenge by [Coodesh](https://coodesh.com/)
