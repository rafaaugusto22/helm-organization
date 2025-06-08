{{/* Nome base do chart */}}
{{- define "nginx-app.name" -}}
{{ .Chart.Name }}
{{- end }}

{{/* Nome do chart com possibilidade de override */}}
{{- define "nginx-app.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else if .Values.nameOverride }}
{{- .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/* Labels padrão recomendados pelo Helm */}}
{{- define "nginx-app.labels" -}}
app.kubernetes.io/name: {{ include "nginx-app.name" . }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Labels para selector */}}
{{- define "nginx-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "nginx-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
