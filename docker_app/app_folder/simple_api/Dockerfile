# Build and test app (7 points)
FROM python:3.10-bookworm

MAINTAINER DevZenzya34 <https://github.com/DevZenzya34>

ADD student_age.py /

#Install flask instructions
RUN apt update -y && apt install python-dev-is-python3 python3-dev libsasl2-dev libldap2-dev libssl-dev -y
#RUN pip3 install -r /requirements.txt
RUN pip3 install flask==2.0.0 flask_httpauth==4.1.0 flask_simpleldap python-dotenv==0.14.0 werkzeug==2.0.0
# Create volume data
VOLUME [ "/data" ]

EXPOSE 5000

# Entrypoint
CMD [ "python", "./student_age.py" ]