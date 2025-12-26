from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_health():
    r = client.get("/health")
    assert r.status_code == 200
    assert r.json()["status"] == "ok"

def test_greet():
    r = client.get("/greet", params={"name": "Arres"})
    assert r.status_code == 200
    assert r.json()["message"] == "Hello, Arres!"
