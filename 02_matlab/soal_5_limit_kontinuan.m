% ==========================================================
% UTS Matematika Sains Data - Semester Genap 2025/2026
% Soal 5 - Analisis Limit dan Kekontinuan CLV
% ----------------------------------------------------------
% Nama    : Aulia Adzkia Rahmah
% NIM     : 2510514029
% Parameter: N=29, a=2, b=9, K=12, theta0=105, alpha=0.01
% Tanggal : 2026-04-20
% ==========================================================

clc; clear; close all;

% Parameter Personalisasi
N = 29; a = 2; b = 9; K = 12;
theta0 = 105;
alpha_lr = 0.01;

%% --- BAGIAN B: VERIFIKASI LIMIT ALJABAR ---

syms x % Menggunakan variabel simbolik

% Perhitungan limit menggunakan fungsi bawaan limit()
L1_hasil = limit((x^2 - K^2) / (x - K), x, K);
L2_hasil = limit((sqrt(x + (K+1)^2) - (K+1)) / x, x, 0);
L3_hasil = limit(((a+2)*x^3 + b*x + 7) / (x^3 - x + K), x, inf);

% Menampilkan hasil ke Command Window
fprintf('--- Hasil Verifikasi Limit ---\n');
fprintf('Nilai L1 (x -> K)   : %d\n', double(L1_hasil));
fprintf('Nilai L2 (x -> 0)   : %.4f\n', double(L2_hasil));
fprintf('Nilai L3 (x -> inf) : %d\n\n', double(L3_hasil));


%% --- BAGIAN G: PLOT KEKONTINUAN FUNGSI BIAYA ---

% Nilai p dan q agar fungsi kontinu (hasil hitung manual)
p = 24; 
q = 0;

figure('Name', 'Analisis Kekontinuan Soal 5.g');
hold on;

% 1. Membuat data untuk interval x < K
x_kiri = linspace(0, K-0.01, 100); 
y_kiri = (x_kiri.^2 - K^2) ./ (x_kiri - K);
plot(x_kiri, y_kiri, 'b', 'LineWidth', 2);

% 2. Menandai titik sambungan di x = K (titik p)
plot(K, p, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8);

% 3. Membuat data untuk interval x > K
x_kanan = linspace(K+0.01, 2*K, 100);
y_kanan = a * x_kanan + q;
plot(x_kanan, y_kanan, 'g', 'LineWidth', 2);

% Tambahkan garis bantu vertikal di x = K
line([K K], [0 p*1.5], 'Color', [0.5 0.5 0.5], 'LineStyle', '--');

% Pengaturan grafik agar rapi
grid on;
title(['Plot Kontinuitas Fungsi Biaya C(x) di x = ', num2str(K)]);
xlabel('Volume Produksi (x)');
ylabel('Biaya Distribusi C(x)');
legend('C(x) x < K', 'Titik Kontinu (p)', 'C(x) x > K', 'Batas x=K');

fprintf('--- Plot Berhasil Dibuat ---\n');