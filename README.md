# garden-gate-pi
Configuration for Garden Gate on Raspberry Pi

# Raspberry Pi Setup

1. Flash an Debian Bullseye arm64 into an SD card.

2. Set up networking ([LAN](https://learn.sparkfun.com/tutorials/headless-raspberry-pi-setup/ethernet-with-static-ip-address), [Wi-Fi](https://learn.sparkfun.com/tutorials/headless-raspberry-pi-setup/wifi-with-dhcp)).

3. [Set up default user (see _Headless setup_ section).](https://www.raspberrypi.com/news/raspberry-pi-bullseye-update-april-2022/) This user must be named **`garten`**.

4. Put the SD card into the Pi and boot it up.

5. SSH into the Pi: `ssh garten@raspberrypi.local`

6. Install Docker: `curl -sSL https://get.docker.com | sh`

7. Set up [ZeroTier](https://www.zerotier.com/download/) and join the network.

8. Set up Docker Compose project:

    ```sh
    git clone https://github.com/creatorsgarten/garden-gate-pi.git
    cd garden-gate-pi
    ```

9. Create and edit `config.json` to set up the doors:

    ```sh
    cp config.example.json config.json
    vi config.json
    ```

10. Run the service:

    ```sh
    docker compose up -d
    ```

11. ~~Setup automatic updater daemon:~~

    ```sh
    sudo systemctl link ./garden-gate-updater.service
    sudo systemctl daemon-reload
    sudo systemctl start garden-gate-updater
    sudo systemctl status garden-gate-updater

    # View logs
    sudo journalctl -u garden-gate-updater -f
    ```

## Deploying new code

```sh
./scripts/update.sh
```
