{{- define "fullname" -}}
{{- if .Chart.Name }}
{{- .Release.Name | printf "%s-%s" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end }}

{{- define "name" -}}
{{ include "fullname" . }}
{{- end }}

{{- define "labels" -}}
app.kubernetes.io/name: {{ .Chart.Name | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
app.kubernetes.io/component: {{ .Values.labels.component | default "api" | quote }}
app.kubernetes.io/part-of: {{ .Values.labels.partOf | default "ecommerce-platform" | quote }}
app.kubernetes.io/environment: {{ .Values.labels.environment | default "staging" | quote }}
app.kubernetes.io/team: {{ .Values.labels.team | default "payments" | quote }}
app.kubernetes.io/version-label: {{ .Values.labels.version | default "v1.2.3" | quote }}
{{- end }}

{{- define "selectorLabels" -}}
app.kubernetes.io/name: {{ .Chart.Name | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end }}

{{- define "hpaFullname" -}}
{{- printf "%s-hpa" (include "fullname" .) -}}
{{- end -}}
