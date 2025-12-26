#!/usr/bin/env bash
set -euo pipefail

python -m pip install --upgrade pip
pip install -r requirements.txt

# start server
uvicorn app.main:app --host 127.0.0.1 --port 8000 &
PID=$!
trap 'kill $PID || true' EXIT

# wait for server
for i in {1..25}; do
  if curl -sf http://127.0.0.1:8000/health > /dev/null; then
    break
  fi
  sleep 0.2
done

curl -sf "http://127.0.0.1:8000/greet?name=integration" | grep -q "Hello, integration"
echo "mock_api integration OK"
