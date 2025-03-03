{{- define "backend-app.labels" -}}
app.kubernetes.io/name: {{ .Values.labels.name | default .Chart.Name | quote }}
app.kubernetes.io/instance: {{ .Values.labels.instance | default .Release.Name | quote }}
app.kubernetes.io/component: {{ .Values.labels.component | default "api" | quote }}
app.kubernetes.io/part-of: {{ .Values.labels.partOf | default "sample-project" | quote }}
app.kubernetes.io/managed-by: "helm"
environment: {{ .Values.labels.environment | default "dev" | quote }}
team: {{ .Values.labels.team | default "devops" | quote }}
version: {{ .Values.labels.version | default .Chart.AppVersion | quote }}
{{- end }}

{{- define "backend-app.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.labels.name | default .Chart.Name | quote }}
app.kubernetes.io/instance: {{ .Values.labels.instance | default .Release.Name | quote }}
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
