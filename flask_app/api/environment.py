import os


def get_postgres_connection_string():
    """Returns postgres connection string from environment"""
    return os.environ["POSTGRES_CONNECTION_STRING"]


def get_redis_connection_dict():
    """Returns redis connection details from environment"""
    return {
        "host": os.environ["REDIS_HOST"],
        "port": os.environ["REDIS_PORT"]
    }
