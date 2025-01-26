# AdventureWorksLT SQL Container

A project for building out a Linux container that is running MS SQL with the AdventureWorksLT database.

```bash

source .env

docker build . -t cwiederspan/adventureworkslt:latest      

docker run -e 'MSSQL_SA_PASSWORD=StrongPassw0rd' -p 1433:1433 --name sql1 -d cwiederspan/adventureworkslt:latest

gh secret set DOCKER_USERNAME -a actions -b"$DOCKER_USERNAME"
gh secret set DOCKER_PASSWORD -a actions -b"$DOCKER_PASSWORD"

```