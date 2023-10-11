"""Counts occurences of words"""

import re

def count_words(sentence):
    """Counts occurences of words"""
    res = {}
    pattern = r"[0-9]+|[a-zA-Z]+(?:'[a-zA-Z]+)?"
    for word in re.findall(pattern, sentence):
        word = word.lower()
        if len(word) == 0:
            continue
        if word in res:
            res[word] += 1
        else:
            res[word] = 1
    print(res)
    return res
