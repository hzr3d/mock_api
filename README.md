# mock_api

## Clean up with a dev branch before merging

A minimal FastAPI microservice used by `mock_frontend`.

## Run locally
```bash
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
uvicorn app.main:app --reload --port 8000
```

## Endpoints
- `GET /health`
- `GET /greet?name=...`
