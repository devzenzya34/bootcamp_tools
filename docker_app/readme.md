# Training docker project on CentOs virtual machine

### Install virtual machine
    Mounting Vm: vagrant up

### Connect to Vagrant and open shell to work : copy app_folder on virutal machine home

    1. Build Images 
        (cmd: docker build -t api-student:v1.0 .)
    2. Create Network (bridge)
        (cmd: docker network create student)
    3. Launch container
        (cmd: docker run -d --network student --name test-api-student -v ${PWD}/student_age.json:/data/student_age.json -p 4000:5000 api-student:v1.0 )
    4. Test container with curl (use vm IP: 192.168.56.3 or localhost )
        (cmd: curl -u toto:python -X GET http://<host_ip>:4000/student/api/v1.0/get_student_ages )

### deploy image IAC (create a docker-compose)
    1. delete container test-api-student and network student
    2. docker compose up -d
    3. fix url api in website/index.php with : "http://student-list_api-student_1:5000/student/api/v1.0/get_student_ages"
    4. Check the local_ip and open app at http://<local_ip>:8082

    