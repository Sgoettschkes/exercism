"""Transform legacy data"""

def transform(legacy_data):
    data = {}

    for key, value in legacy_data.items():
        for char in value:
            data[char.lower()] = key

    return data
