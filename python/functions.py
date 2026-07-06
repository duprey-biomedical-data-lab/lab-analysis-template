"""
Reusable functions for this project.

If you write the same chunk of code three times, it belongs here.
"""


def format_estimate(est, lower, upper, digits=2):
    """
    Format a point estimate with its confidence interval for manuscripts.

    Example:
        1.42 (1.10 to 1.83)
    """
    return f"{est:.{digits}f} ({lower:.{digits}f} to {upper:.{digits}f})"


def suppress_small_cells(counts, threshold=11):
    """
    Suppress small cells before anything leaves the secure environment.

    Counts below the threshold get replaced with None so they cannot be
    exported or committed by accident. Default threshold of 11 matches most
    data use agreements, but change it if yours says otherwise.
    """
    if counts < threshold and counts > 0:
        return None
    return counts