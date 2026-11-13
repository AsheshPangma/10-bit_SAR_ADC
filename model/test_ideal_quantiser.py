import numpy as np

def sqnr_db(n_bits=10, fs=2.0, m=4096, cycles=1021):
    lsb = fs / 2**n_bits
    n = np.arange(m)
    x = 0.999999 * fs / 2 * np.sin(2 * np.pi * cycles * n / m)
    code = np.clip(np.floor((x + fs / 2) / lsb), 0, 2**n_bits - 1)
    y = (code + 0.5) * lsb - fs / 2
    p = np.abs(np.fft.rfft(y))**2
    return 10 * np.log10(p[cycles] / (p[1:].sum() - p[cycles]))

def test_ideal_sqnr():
    assert abs(sqnr_db() - (6.02 * 10 + 1.76)) < 0.2
