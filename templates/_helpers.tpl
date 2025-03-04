{{- define "backend-app.labels" -}}
project: {{ .Values.labels.project | default "default-project" | quote }}
projectService: {{ .Values.labels.projectService | default "default-service" | quote }}
environment: {{ .Values.labels.environment | default "dev" | quote }}
team: {{ .Values.labels.team | default "devops" | quote }}
{{- end }}

{{- define "backend-app.selectorLabels" -}}
project: {{ .Values.labels.project | default "default-project" | quote }}
projectService: {{ .Values.labels.projectService | default "default-service" | quote }}
{{- end }}

{{- define "backend-app.name" -}}
{{ include "backend-app.fullname" . }}
{{- end }}

{{- define "backend-app.fullname" -}}
{{- if .Chart.Name }}
{{- .Release.Name | printf "%s-%s" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end }}
