FROM python:3.7-slim-buster
RUN pip install flask
CMD ["python","app.py"]
COPY app.py /app.py
