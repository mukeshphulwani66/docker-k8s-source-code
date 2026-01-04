FROM ubuntu:20.04

# Install SSH + Python
RUN apt-get update && \
    apt-get install -y openssh-server python3 sudo && \
    rm -rf /var/lib/apt/lists/*

# Create required SSH directories
RUN mkdir -p /run/sshd /home/ansible/.ssh

# Create ansible user
RUN useradd -m -s /bin/bash ansible && \
    echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Copy your public key
COPY id_rsa.pub /home/ansible/.ssh/authorized_keys

# Fix permissions
RUN chown -R ansible:ansible /home/ansible/.ssh && \
    chmod 700 /home/ansible/.ssh && \
    chmod 600 /home/ansible/.ssh/authorized_keys


# Expose SSH
EXPOSE 22

# Run SSH daemon in foreground
CMD ["/usr/sbin/sshd","-D"]
