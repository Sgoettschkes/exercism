"""Reverse a string"""

def reverse(text):
    """Reverse a string"""
    res = ""
    for char in text:
        res = char + res
    return res
