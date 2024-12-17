FROM grafana/grafana:11.2.0

COPY ./grafana/settings/dashboard_setup.json /etc/grafana/provisioning/dashboards/imported-dashboards/dashboard.json
COPY ./grafana/settings/prometheus-datasource.yml /etc/grafana/provisioning/datasources/prometheus-datasource.yml
COPY ./grafana/settings/grafana-dashboard.yml /etc/grafana/provisioning/dashboards/grafana-dashboard.yml

EXPOSE 3000
