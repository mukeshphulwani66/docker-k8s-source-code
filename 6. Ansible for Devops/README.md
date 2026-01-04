
# Ansible Lab Setup Guide
<img width="674" height="422" alt="image" src="https://github.com/user-attachments/assets/b016ec98-8080-442c-8d25-692be3c6d84d" />

## 1. Setup

### Create `ssh-keys` folder
This folder will store your SSH private and public keys used for Ansible authentication.

```bash
mkdir ssh-keys
```

### Create SSH key pair  
Generate a 4096-bit RSA private/public key pair for secure, passwordless SSH authentication.

```bash
ssh-keygen -t rsa -b 4096 -f ssh-keys/id_rsa
```

- `id_rsa` → private key (KEEP SAFE, do NOT commit to Git)  
- `id_rsa.pub` → public key (shared with managed containers)

### Copy public key into managed node build context  
Your managed container Dockerfile expects the public key inside the managed folder.  
This ensures that the managed container automatically trusts the Ansible master user.

```bash
copy ssh-keys\id_rsa.pub managed\id_rsa.pub
```

---

## 2. Build and Start the Lab

Use Docker Compose to build all images and start the Ansible master and managed nodes.

```bash
docker compose up -d
```

- `--build` (optional) forces rebuilding Docker images  
- `-d` runs containers in detached mode

---

## 3. Helpful Docker Commands

### Start an interactive Ubuntu container (for testing)
```bash
docker run -it --name my-ubuntu ubuntu bash
```

### Restart and attach to an existing container
```bash
docker container start -ai my-ubuntu
```

### Open a shell inside any already-running container
Useful for debugging permissions, SSH, environment variables, etc.

```bash
docker exec -it <container_id_or_name> bash
```

Replace `<container_id_or_name>` with container names like `ansible-master`, `ubuntu1`, etc.
