#!/usr/bin/env bash
set -euo pipefail
# ─────────────────────────────────────────────────────────────────────────────
# One-shot local bring-up on Minikube (the "full marks" path).
# The fraud image is pre-built and public, so there is nothing to build — Kubernetes
# pulls it. This applies the API + Redis + Service + HPA and waits for readiness.
# ─────────────────────────────────────────────────────────────────────────────
source "$(dirname "$0")/../config.env"
HW4_DIR="$(cd "$(dirname "$0")/.." && pwd)"

echo "▶ starting Minikube (if not already running)…"
minikube status >/dev/null 2>&1 || minikube start
echo "▶ enabling metrics-server (needed by the HPA)…"
minikube addons enable metrics-server

echo "▶ applying manifests (Redis, API, Service, HPA)…"
kubectl apply -f "${HW4_DIR}/k8s/redis.yaml"
kubectl apply -f "${HW4_DIR}/k8s/deployment.yaml"
kubectl apply -f "${HW4_DIR}/k8s/service.yaml"
kubectl apply -f "${HW4_DIR}/k8s/hpa.yaml"

echo "▶ waiting for pods…"
kubectl rollout status deployment/redis --timeout=120s
kubectl rollout status deployment/trustbank-fraud --timeout=180s
kubectl get pods,svc,hpa -o wide

echo
echo "✅ up. Reach the API with a port-forward (simplest), in a second terminal:"
echo "      kubectl port-forward svc/trustbank-fraud 8080:80"
echo "   then:"
echo "      ${HW4_DIR}/scripts/smoke_test.sh http://localhost:8080"
