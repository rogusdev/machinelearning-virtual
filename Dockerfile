FROM python:3.7

WORKDIR /app

COPY requirements.txt /app/

RUN pip install --trusted-host pypi.python.org -r requirements.txt

COPY . /app

EXPOSE 80

#ENV NAME World

CMD ["python", "app.py"]

# https://docs.docker.com/get-started/part2/#dockerfile
# docker build -t machinelearning . && docker run -p 4000:80 machinelearning

# docker run -it machinelearning /bin/bash
