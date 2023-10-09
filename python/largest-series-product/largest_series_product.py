"""Calculate largest product"""

def largest_product(series, size):
    """Calculate largest product"""
    if len(series) < size:
        raise ValueError("span must be smaller than string length")

    if size < 0:
        raise ValueError("span must not be negative")

    begin = 0

    result = 0

    while begin + size <= len(series):
        number_str = series[begin:begin + size]
        product = 1
        for char in number_str:
            try:
                product = product * int(char)
            except Exception as exc:
                raise ValueError("digits input must only contain digits") from exc
        if product > result:
            result = product
        begin += 1

    return result
