{{/* Nome base do chart */}}
{{- define "chart-name.name" -}}
{{ .Chart.Name }}
{{- end }}

{{/* Nome do chart com possibilidade de override */}}
{{- define "chart-name.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else if .Values.nameOverride }}
{{- .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/* Labels padrão recomendados pelo Helm */}}
{{- define "chart-name.labels" -}}
app.kubernetes.io/name: {{ include "chart-name.name" . }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Labels para selector */}}
{{- define "chart-name.selectorLabels" -}}
app.kubernetes.io/name: {{ include "chart-name.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
