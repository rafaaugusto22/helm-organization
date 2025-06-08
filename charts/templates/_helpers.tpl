{{- define "nginx-app.labels" -}}
app.kubernetes.io/name: {{ include "nginx-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "nginx-app.name" -}}
{{ .Chart.Name }}
{{- end }}
