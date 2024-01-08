from django.test import TestCase
from djangoapp.views import add
from djangoapp.views import subtract

# Create a test case class that inherits from Django's TestCase class
class MyFunctionTestCase(TestCase):

    def test_addition(self):
        result = add(3, 5)
        self.assertEqual(result, 9, "Incorrect addition result")

    # def test_substract(self):       
    #     result = sub(10,7)
    #     self.assertEqual(result, 3, "Incorrect addition result")