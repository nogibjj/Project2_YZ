# Project #2: Bash Command-Line Tool

[![Python application test with Github Actions](https://github.com/nogibjj/Project2_YZ/actions/workflows/main.yml/badge.svg)](https://github.com/nogibjj/Project2_YZ/actions/workflows/main.yml)

In this project, I wrote a bash script to generate random password. I pushed it to DockerHub and tested running it using both GitHub codespaces and AWS Cloud9. 

Here is the schema of my project:

<img src="https://user-images.githubusercontent.com/110933007/194449214-419cf59d-6552-43d9-a546-ed0a30a4ef33.png" width=80% height=80%>

### 1. Connect DockerHub and GitHub Codespaces

Create a new token in DockerHub, and then paste it to a new GitHub Codespaces secret. 

<img src="https://user-images.githubusercontent.com/110933007/194458895-b369a6d7-6e76-4e32-8f2d-83c3ed0637ef.png" width=70% height=70%>

### 2. Create Bash Script

After building the scaffold, I wrote a bash script in my repo. The bash script main.sh will automatically generate a random password using lower letter, upper letter, and number 0-9. The generated password will not contain 'l' because it may cause confusion with number 1, and will not include letter 'o' or 'O' since it looks like number 0. The main.sh takes in one parameter as the length of the password and it will generate a 12-length password by default. 

To test the script locally:

```
chmod +x main.sh
bash main.sh 
bash main.sh 20
```


### 3. Build Docker

In GitHub codespaces, type in the following code to build a docker image, list all the image id, and then run the main.sh in the image. 
Here 'f2b3d380ffb5' is the image id. 

```
docker build
docker image ls
docker run -it f2b3d380ffb5 /bin/bash main.sh 20
```

### 4. Push to DockerHub

Use your user name of DockerHub and the created secret to log in. Then build a new docker and push it to DockerHub. 

```
docker login -u <docker user id> -p $DOCKER_HUB
docker build . -t <docker user id>/<repo name>
docker push <docker user id>/<repo name>
```


### 5. Pull from DockerHub

#### Run in Codespaces

To run it locally in codespaces:

```
docker run -it <docker user id>/<repo name>:latest /bin/bash main.sh 20
```

#### Run in AWS Cloud9

To run it locally:

```
docker run -it <user id in DockerHub>/<repo name>:latest /bin/bash main.sh 20
```

Then create a new ECR repository, go to "View push demands", type in the following code to tag the image and then push it to this repository.

```
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 719446158092.dkr.ecr.us-east-1.amazonaws.com
docker tag yjzhu888/generate_password 719446158092.dkr.ecr.us-east-1.amazonaws.com/try1:latest
docker push 719446158092.dkr.ecr.us-east-1.amazonaws.com/try1:latest
```

To verify, run it in a new Cloud9 instance

```
docker run -it 719446158092.dkr.ecr.us-east-1.amazonaws.com/try1:latest /bin/bash main.sh 20
```

