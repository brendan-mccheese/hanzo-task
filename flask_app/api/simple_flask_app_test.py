import sys
import unittest
from unittest.mock import MagicMock
from . import environment, simple_flask_app


# Flask app unit tests
class SimpleFlaskAppTests(unittest.TestCase):
    POSTGRES_CONNECTION = "postgres://foo:3233"
    REDIS_CONNECTION = {
        "host": "moo",
        "port": "1234"
    }

    def setUp(self):
        environment.get_postgres_connection_string = MagicMock(return_value=self.POSTGRES_CONNECTION)
        environment.get_redis_connection_dict = MagicMock(return_value=self.REDIS_CONNECTION)
        pass

    def test_returns_hello_world(self):
        result = simple_flask_app.hello_world()
        self.assertEqual(result, "Hello, World!", "Not the correct hello world string!")

    def test_returns_postgres_connection_string(self):
        result = simple_flask_app.hello_postgres()
        self.assertEqual(result, self.POSTGRES_CONNECTION, 'Incorrect postgres connection string')

    def test_returns_redis_connection(self):
        result = simple_flask_app.hello_redis()
        self.assertEqual(result, self.REDIS_CONNECTION)


if __name__ == '__main__':
    unittest.main()
