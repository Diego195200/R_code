import numpy as np
import scipy.stats as sp

LAMBDA = 0.4

b = np.array([0.4, 0.45, 0.5, 0.6, 0.7, 0.8, 0.9, 1, 1.2, 1.4, 1.6, 1.8, 2])

P = [sp.poisson.pmf(n, LAMBDA) for n in range(0, 14)]

M = np.array(
    [
        [P[0], P[1], P[2], P[3], P[4], P[5], P[6], P[7], P[8], P[9], P[10], P[11], 1-(P[0] + P[1] + P[2] + P[3] + P[4] + P[5] + P[6] + P[7] + P[8] + P[9] + P[10] + P[11])],
        [P[0], 0, P[1], P[2], P[3], P[4], P[5], P[6], P[7], P[8], P[9], P[10], 1 - (P[0] + P[1] + P[2] + P[3] + P[4] + P[5] + P[6] + P[7] + P[8] + P[9] + P[10])],
        [0, P[0], 0, P[1], P[2], P[3], P[4], P[5], P[6], P[7], P[8], P[9], 1 - (P[0] + P[1] + P[2] + P[3] + P[4] + P[5] + P[6] + P[7] + P[8] + P[9])],
        [0, 0, P[0], 0, P[1], P[2], P[3], P[4], P[5], P[6], P[7], P[8], 1 - (P[0] + P[1] + P[2] + P[3] + P[4] + P[5] + P[6] + P[7] + P[8])],
        [0, 0, 0, P[0], 0, P[1], P[2], P[3], P[4], P[5], P[6], P[7], 1 - (P[0] + P[1] + P[2] + P[3] + P[4] + P[5] + P[6] + P[7])],
        [0, 0, 0, 0, P[0], 0, P[1], P[2], P[3], P[4], P[5], P[6], 1 - (P[0] + P[1] + P[2] + P[3] + P[4] + P[5] + P[6])],
        [0, 0, 0, 0, 0, P[0], 0, P[1], P[2], P[3], P[4], P[5], 1 - (P[0] + P[1] + P[2] + P[3] + P[4] + P[5])],
        [0, 0, 0, 0, 0, 0, P[0], 0, P[1], P[2], P[3], P[4], 1 - (P[0] + P[1] + P[2] + P[3] + P[4])],
        [0, 0, 0, 0, 0, 0, 0, P[0], 0, P[1], P[2], P[3], 1 - (P[0] + P[1] + P[2] + P[3])],
        [0, 0, 0, 0, 0, 0, 0, 0, P[0], 0, P[1], P[2], 1 - P[0] - P[1] - P[2]],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, P[0], 0, P[1], 1 - P[0] - P[1]],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, P[0], 0, 1 - P[0]],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, P[0], 1 - P[0]]

    ]
)

P_0 = np.array([0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0])

M_0 = np.linalg.matrix_power(M, 0).T
M_1 = np.linalg.matrix_power(M, 1).T
M_5 = np.linalg.matrix_power(M, 5).T
M_10 = np.linalg.matrix_power(M, 10).T
M_20 = np.linalg.matrix_power(M, 20).T
M_30 = np.linalg.matrix_power(M, 30).T

P_1 = M_1.dot(P_0)
P_5 = M_5.dot(P_0)
P_10 = M_10.dot(P_0)
P_20 = M_20.dot(P_0)
P_30 = M_30.dot(P_0)

prima_med_0 = np.sum(P_0 * b)
prima_med_1 = np.sum(P_1 * b)
prima_med_5 = np.sum(P_5 * b)
prima_med_10 = np.sum(P_10 * b)
prima_med_20 = np.sum(P_20 * b)
prima_med_30 = np.sum(P_30 * b)

print(f'Prima media para periodo 0: {prima_med_0}')
print(f'Prima media para periodo 1: {prima_med_1}')
print(f'Prima media para periodo 5: {prima_med_5}')
print(f'Prima media para periodo 10: {prima_med_10}')
print(f'Prima media para periodo 20: {prima_med_20}')
print(f'Prima media para periodo 30: {prima_med_30}')

