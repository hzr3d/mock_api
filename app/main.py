from fastapi import FastAPI
from mock_lib import greet

app = FastAPI(title="mock_api")

@app.get("/health")
def health():
    return {"status": "ok"}

@app.get("/greet")
def greet_endpoint(name: str = ""):
    return {"message": greet(name)}
