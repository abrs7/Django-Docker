FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . .

# RUN python manage.py collectstatic --noinput

EXPOSE 8008

# CMD ["python", "manage.py", "runserver", "0.0.0.0:8008"]
# CMD ["sh", "-c", "python manage.py collectstatic --noinput && python manage.py runserver 0.0.0.0:8008"]
ENTRYPOINT [ "gunicorn", "a_core.wsgi", "-b", "0.0.0.0:8008"]