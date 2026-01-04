FROM ubuntu:20.04

# Install dependencies: SSH client, Python, sudo, git, pip
RUN apt-get update && \
    apt-get install -y openssh-client python3 python3-pip sudo git curl && \
    rm -rf /var/lib/apt/lists/*

# Install Ansible via pip
RUN pip3 install ansible

# Create a user to run Ansible
RUN useradd -m -s /bin/bash ansible && \
    echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to ansible user
USER ansible
WORKDIR /home/ansible

# Keep container running
CMD ["/bin/bash"]
