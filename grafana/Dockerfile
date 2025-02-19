FROM grafana/grafana:11.2.0

COPY ./settings/dashboard_setup.json /etc/grafana/provisioning/dashboards/imported-dashboards/dashboard.json
COPY ./settings/prometheus-datasource.yml /etc/grafana/provisioning/datasources/prometheus-datasource.yml
COPY ./settings/grafana-dashboard.yml /etc/grafana/provisioning/dashboards/grafana-dashboard.yml

ENV GF_SERVER_ROOT_URL=http://localhost:3000/monitoring
ENV GF_SERVER_SERVE_FROM_SUB_PATH=true

EXPOSE 3000
