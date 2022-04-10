FROM ubuntu:18.04
RUN apt-get update -y
RUN apt-get install -y git
RUN apt-get install -y wget
RUN apt-get install -y nano
RUN apt-get install -y nginx
RUN apt-get install ansible -y
RUN apt-get install python -y
RUN mkdir ansible
WORKDIR ansible
COPY index.j2 /ansible
COPY playbook.yml /ansible
RUN ansible-playbook -i hosts playbook.yml
WORKDIR /
EXPOSE 80
STOPSIGNAL SIGQUIT
CMD ["nginx", "-g", "daemon off;"]