{{- define "backend-app.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | quote }}
{{- else if .Chart.Name }}
{{- printf "%s" .Chart.Name | quote }}
{{- else }}
"backend-app"
{{- end }}
{{- end }}

{{- define "backend-app.labels" -}}
app.kubernetes.io/name: {{ include "backend-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/component: {{ default "api" .Values.labels.component | quote }}
app.kubernetes.io/part-of: {{ default "my-project" .Values.labels.partOf | quote }}
app.kubernetes.io/managed-by: "helm"
environment: {{ default "dev" .Values.labels.environment | quote }}
team: {{ default "myteam" .Values.labels.team | quote }}
version: {{ default "v1.0.0" .Values.labels.version | quote }}
{{- end }}

{{- define "backend-app.name" -}}
{{- default .Chart.Name .Chart.Name -}}
{{- end }}
