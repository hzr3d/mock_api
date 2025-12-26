FROM python:3.11-slim

WORKDIR /app
ENV PYTHONDONTWRITEBYTECODE=1     PYTHONUNBUFFERED=1

# Copy shared lib and service code (tutorial-friendly approach).
# In real multi-repo usage, you'd consume mock_lib from a package registry.
COPY ../mock_lib /mock_lib
COPY . /app

RUN pip install --no-cache-dir --upgrade pip     && pip install --no-cache-dir -r requirements.txt

EXPOSE 8000
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
