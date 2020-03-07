"""Simple Flask API"""

from flask import Flask
from . import environment

# pylint: disable=C0103
app = Flask(__name__)


@app.route('/')
def hello_world():
    """Returns hello world string"""
    return 'Hello, World!'


@app.route('/postgres')
def hello_postgres():
    """Unsafely returns postgres connection string"""
    return environment.get_postgres_connection_string()


@app.route('/redis')
def hello_redis():
    """Unsafely returns redis connection details"""
    return environment.get_redis_connection_dict()
    