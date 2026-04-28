% ==========================================================
% UTS Matematika Sains Data – Semester Genap 2025/2026
% Soal 7 – Forecasting Penjualan & Analisis Tren
% ----------------------------------------------------------
% Nama      : Aulia Adzkia Rahmah
% NIM       : 2510514029
% Parameter  : N=29, a=2, b=9, K=12, alpha=0.01
% Tanggal   : 2026-04-20
% ==========================================================

clc; clear; close all;

% Parameter Personalisasi
K = 12;
a = 2;

% Data penjualan dari tabel di kertas
n = 1:12;
S = [59, 77, 83, 101, 107, 125, 131, 149, 155, 173, 179, 197];

%% --- 7.2.c VERIFIKASI SIGMA ---
T1 = sum(S);        % Total Penjualan
T2 = sum(S.^2);     % Sum of Squares

fprintf('T1 (Total Penjualan) : %.0f\n', T1);
fprintf('T2 (Sum of Squares)  : %.0f\n\n', T2);

%% --- 7.4.e FORECASTING ---
% Angka ini diambil langsung dari hitungan di kertas kamu
m = 12.545;  % slope
c = 46.455;  % intercept

% Hitung garis tren untuk data historis (bulan 1-12)
S_tren = m * n + c;

% Hitung prediksi untuk 6 bulan ke depan (bulan 13-18)
n_prediksi = 13:18;
S_prediksi = m * n_prediksi + c;

% Tampilkan hasil prediksi di Command Window
fprintf('Hasil Prediksi 6 Bulan Ke Depan:\n');
for i = 1:6
    fprintf('Bulan %d : %.2f Juta\n', n_prediksi(i), S_prediksi(i));
end

% --- PLOT GRAFIK SEDERHANA ---
figure;
plot(n, S, 'bo-', 'LineWidth', 1.5); hold on;   % Data asli (biru)
plot(n, S_tren, 'r--', 'LineWidth', 2);         % Garis tren (merah)
plot(n_prediksi, S_prediksi, 'g^', 'MarkerSize', 8); % Prediksi (hijau)

grid on;
title('Forecasting Penjualan (Bulan 1-18)');
xlabel('Bulan'); ylabel('Juta Rupiah');
legend('Data Historis', 'Garis Tren', 'Prediksi');

%% --- 7.4.f HITUNG MAE ---
% Selisih absolut antara data asli dan garis tren
selisih = abs(S - S_tren);
mae = sum(selisih) / 12;

fprintf('\nMean Absolute Error (MAE): %.2f\n', mae);