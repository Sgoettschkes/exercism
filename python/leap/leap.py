"""Function to calculate leap year."""

def leap_year(year):
    """Function to calculate leap year."""
    return year % 4 == 0 and (year % 100 != 0 or year % 400 == 0)
