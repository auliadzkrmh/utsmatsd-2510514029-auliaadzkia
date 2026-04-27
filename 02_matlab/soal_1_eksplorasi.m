% ===================================================
% UTS Matematika Sains Data - Semester Genap 2025/2026
% Soal 1 - Statistik Deskriptif dan Diagram Batang
%
% Nama : Aulia Adzkia Rahmah
% NIM  : 2510514029
% Parameter: N=29, a=2, b=9, K=12, theta0=105, alpha=0.01
% Tanggal: 2026-04-23
% ===================================================

clc; clear; close all;

% Parameter personalisasi
N = 29;
a = 2;
b = 9;
K = 12;

theta0 = 105;
alpha_lr = 0.01;

% Timestamp untuk screenshot command window
disp('time stamp');
disp(datetime('now','Format','default'));

% Data penjualan
D = [30 45 60 68 83 93 101];

% Statistik deskriptif
rata_rata = mean(D);
median_data = median(D);
modus = mode(D);
jangkauan = range(D);
std_pop = std(D,1);

% Tampilkan hasil
disp('===== HASIL VERIFIKASI MATLAB =====')
fprintf('Mean                = %.2f\n',rata_rata);
fprintf('Median              = %.2f\n',median_data);
fprintf('Mode (MATLAB)       = %.2f\n',modus);
fprintf('Range               = %.2f\n',jangkauan);
fprintf('Standar Deviasi     = %.2f\n',std_pop);

if length(unique(D)) == length(D)
disp('Catatan: Secara statistik tidak ada modus')
end

%% Diagram batang penjualan per toko
figure

bar(D)
hold on

% garis rata-rata horizontal
yline(rata_rata,'--','Rata-rata','LineWidth',2);

% label sumbu
xlabel('Nomor Toko')
ylabel('Penjualan (Juta Rupiah)')

% ganti dengan NIM Anda
title('Diagram Penjualan per Toko - NIM (Isi NIM Anda)')

grid on

% simpan sebagai PNG
saveas(gcf,'diagram_penjualan_toko.png');