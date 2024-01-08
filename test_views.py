from django.test import TestCase
from djangoapp.views import add

# Create a test case class that inherits from Django's TestCase class
class MyFunctionTestCase(TestCase):

    # Define a test method that starts with "test_"
    def test_addition(self):
        # Test case
        result = add(3, 5)
        # Assertion to check if the result matches the expected value
        self.assertEqual(result, 8, "Incorrect addition result")
