{{- define "backend-app.name" -}}
{{- if .Values.nameOverride -}}
{{- .Values.nameOverride | quote }}
{{- else -}}
{{- include "backend-app.fullname" . -}}
{{- end -}}
{{- end -}}

{{- define "backend-app.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | quote }}
{{- else -}}
{{ include "backend-app.chart" . }}-{{ .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end -}}
{{- end -}}

{{- define "backend-app.chart" -}}
{{ .Chart.Name }}
{{- end -}}

{{- define "backend-app.labels" -}}
app.kubernetes.io/name: {{ include "backend-app.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/part-of: {{ .Chart.Name | quote }}
app.kubernetes.io/managed-by: "Helm"
{{- end -}}
