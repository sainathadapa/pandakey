import unittest
import pandakey as sut


@unittest.skip("Don't forget to test!")
class PandakeyTests(unittest.TestCase):

    def test_example_fail(self):
        result = sut.pandakey_example()
        self.assertEqual("Happy Hacking", result)
