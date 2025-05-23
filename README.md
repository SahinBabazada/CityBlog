# CityTest

License [MIT](/LICENSE)

## Deployment (MVP - Contabo)

This section provides instructions to build and run the application using Docker, suitable for an MVP deployment on a server like Contabo.

### Prerequisites
- Docker installed on your local machine and on the deployment server.

### Build the Docker Image
Navigate to the project's root directory (where the `Dockerfile` is located) and run:
```bash
docker build -t cityblog .
```

### Run the Docker Container
Once the image is built, you can run it as a container:
```bash
docker run -d -p 80:3000 cityblog
```
This command runs the container in detached mode (`-d`) and maps port 80 on the host to port 3000 in the container. You can then access the application via `http://your_server_ip`. If you want to use a different host port, change `80` to your desired port (e.g., `8080:3000`).

### Deploying to Contabo (General Guidance)
1.  **Provision a VPS:** Set up a Virtual Private Server (VPS) on Contabo with an operating system that supports Docker (e.g., Ubuntu).
2.  **Install Docker:** Connect to your VPS via SSH and install Docker by following the official Docker installation instructions for your chosen OS.
3.  **Transfer Image or Dockerfile:**
    *   **Option A (Transfer Image):** You can save your locally built Docker image (`docker save cityblog > cityblog.tar`), transfer `cityblog.tar` to your VPS (e.g., using `scp`), and then load it on the VPS (`docker load < cityblog.tar`).
    *   **Option B (Build on Server):** Transfer your project files (including the `Dockerfile`) to the VPS (e.g., using `git clone` or `scp`), and then build the Docker image directly on the server using the `docker build` command mentioned above.
4.  **Run the Container:** Use the `docker run` command on your VPS as shown above.
5.  **Firewall:** Ensure your VPS firewall (if any, like `ufw` on Ubuntu) allows incoming connections on the port you've mapped (e.g., port 80).
6.  **DNS (Optional):** For a more professional setup, point a domain name to your server's IP address.

