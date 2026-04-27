% ==========================================================
% UTS Matematika Sains Data - Semester Genap 2025/2026
% Soal 3 - Himpunan dan Fungsi Pelanggan
% ----------------------------------------------------------
% Nama    : Aulia Adzkia Rahmah
% NIM     : 2510514029
% Parameter: N=29, a=2, b=9, K=12, theta0=105, alpha=0.01
% Tanggal : 2026-04-20
% ==========================================================

clc; clear; close all;

% --- 1. SETTING PARAMETER ---
N = 29; a = 2; b = 9; K = 12;
theta0 = 105; 
alpha_lr = 0.01;

%% --- 2. OPERASI HIMPUNAN ---

% Mendefinisikan himpunan berdasarkan rumus N yang diberikan
A = [N, N+2, N+4, N+7, N+10, N+13, N+15];
B = [N+3, N+5, N+7, N+10, N+12, N+18];
C = [N+1, N+7, N+10, N+11, N+17, N+20];

% Menghitung operasi himpunan sesuai soal
u_abc   = union(A, union(B, C));        % A gabung B gabung C
i_abc   = intersect(A, intersect(B, C)); % Irisan ketiganya
res_c   = setdiff(union(A, B), C);      % (A U B) dikurangi anggota C
res_d   = setxor(A, B);                 % Selisih simetris A dan B

% Menampilkan hasil jumlah anggota
fprintf('Kardinalitas |A U B U C|     : %d\n', length(u_abc));
fprintf('Kardinalitas |A n B n C|     : %d\n', length(i_abc));
fprintf('Kardinalitas |(A U B) n C''| : %d\n', length(res_c));
fprintf('Kardinalitas |A XOR B|       : %d\n\n', length(res_d));

%% --- 3. ANALISIS FUNGSI ---

% Nilai uji untuk pembuktian komutatif
x_test = b + 2; 

% Menghitung (f o g)(x) secara bertahap
% Langkah 1: Hitung g(x)
hasil_g = (x_test^2 / (b + 1)) + a;
% Langkah 2: Masukkan hasil_g ke fungsi f
fog = K * hasil_g + (a + b);

% Menghitung (g o f)(x) secara bertahap
% Langkah 1: Hitung f(x)
hasil_f = K * x_test + (a + b);
% Langkah 2: Masukkan hasil_f ke fungsi g
gof = (hasil_f^2 / (b + 1)) + a;

% Verifikasi Invers (Kebutuhan Akuntansi)
% Pendapatan target: y = K*100 + a + b
y_target = K*100 + a + b;
% Mencari nilai x dengan membalik rumus f (Invers manual)
x_invers = (y_target - (a + b)) / K;

% Menampilkan hasil analisis fungsi
fprintf('Hasil (f o g)(%d) : %.2f\n', x_test, fog);
fprintf('Hasil (g o f)(%d) : %.2f\n', x_test, gof);
fprintf('Verifikasi Akuntansi: x = %.0f\n', x_invers);