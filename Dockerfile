FROM python

WORKDIR /app

COPY . .

RUN pip install flask
RUN pip install python-dotenv
RUN pip install mysql-connector-python

EXPOSE 5000

CMD python app.py
