To enable SSH on your Ubuntu machine, you need to install and configure the OpenSSH server. Below are the steps:

1. Install the OpenSSH server:
    ```bash
    sudo apt update
    sudo apt install openssh-server -y
    ```

2. Check the status of the SSH service:
    ```bash
    sudo systemctl status ssh
    ```

3. If the SSH service is not running, start it:
    ```bash
    sudo systemctl start ssh
    ```

4. Enable the SSH service to start on boot:
    ```bash
    sudo systemctl enable ssh
    ```

5. Find the IP address of your Ubuntu machine:
    ```bash
    ip a
    ```
    Look for the IP address under the network interface (e.g., `eth0` or `ens33`).

6. On your Windows machine, use an SSH client like PuTTY or the built-in `ssh` command in PowerShell:
    ```bash
    ssh username@<Ubuntu_IP>
    ```
    Replace `username` with your Ubuntu username and `<Ubuntu_IP>` with the IP address you found earlier.

Make sure your VMware network settings allow communication between the host (Windows) and the guest (Ubuntu). Use "Bridged" or "NAT" mode as appropriate.