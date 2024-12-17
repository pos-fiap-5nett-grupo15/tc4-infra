FROM grafana/grafana:11.2.0

COPY ./settings/dashboard_setup.json /etc/grafana/provisioning/dashboards/imported-dashboards/dashboard.json
COPY ./settings/prometheus-datasource.yml /etc/grafana/provisioning/datasources/prometheus-datasource.yml
COPY ./settings/grafana-dashboard.yml /etc/grafana/provisioning/dashboards/grafana-dashboard.yml

EXPOSE 3000
