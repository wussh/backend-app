{{- define "backend-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "backend-app.fullname" -}}
{{- if .Values.fullnameOverride }}
  {{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else }}
  {{- include "backend-app.name" . }}-{{ .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

# Standard labels from .Values.labels with defaults:
{{- define "backend-app.labels" -}}
app.kubernetes.io/name: {{ default "backend-service" .Values.labels."app.kubernetes.io/name" }}
app.kubernetes.io/instance: {{ default "backend-v1" .Values.labels."app.kubernetes.io/instance" }}
app.kubernetes.io/component: {{ default "api" .Values.labels."app.kubernetes.io/component" }}
app.kubernetes.io/part-of: {{ default "ecommerce-platform" .Values.labels."app.kubernetes.io/part-of" }}
app.kubernetes.io/managed-by: {{ default "helm" .Values.labels."app.kubernetes.io/managed-by" }}
environment: {{ default "staging" .Values.labels.environment }}
team: {{ default "payments" .Values.labels.team }}
version: {{ default "v1.2.3" .Values.labels.version }}
{{- end }}

# For selectors, you typically want something simpler and stable (often just "app: <release name>"):
{{- define "backend-app.selectorLabels" -}}
app: {{ include "backend-app.fullname" . }}
{{- end }}
