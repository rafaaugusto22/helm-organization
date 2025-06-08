{{/* Helper template for fullname */}}
{{- define "chart-name.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride }}
{{- else }}
{{- printf "%s-%s" .Release.Name .Chart.Name }}
{{- end }}
{{- end }}
