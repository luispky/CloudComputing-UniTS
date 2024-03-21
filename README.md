The File Storage System implemented is well described in the report (**PALACIOSFLORES_report.pdf**).

# Launching the system

In order to use the file storage system created for this project the following steps can be followed:

1. **Create network**: Run `./create_network.sh`
2. **Launch Nextcloud**: Use `docker-compose -f docker-compose.yml up -d`
3. **Sign-in and install Nextcloud**: Access `localhost:8080` in your browser.
4. **Enable basic security measurements and `nextcloud` trusted domain (without this local domain all the load testing functions fail):**: Execute `./security_setup.sh`
5. **Configure Grafana**: Access `localhost:3000` in your browser.
   - Log in with default credentials: `admin` for both user and password.
   - Navigate to Connections > Data Sources > Add data source.
   - Select Prometheus > Settings > Connection. Introduce URL `http://localhost:9090`.
   - Go to Settings > Build a dashboard > Import a dashboard.
   - Add AlertManager as a Data Source with URL `http://alertmanager:9093`.
6. **Create users**: Run `./create_users.sh`
7. **Generate test data for load-testing**: Execute `./generate_data.sh`
8. **Launch Locust**: Use `docker-compose -f docker-compose-locust.yml up -d`
9. **Load-test with Locust**: Access `localhost:8089` in your browser.
10. **Delete users**: Run `./delete_users.sh`

# Dependencies

- Docker
- Docker Compose