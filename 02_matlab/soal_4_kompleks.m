% ==========================================================
% UTS Matematika Sains Data - Semester Genap 2025/2026
% Soal 4 - Bilangan Kompleks (Fasor)
% ----------------------------------------------------------
% Nama    : Aulia Adzkia Rahmah
% NIM     : 2510514029
% Parameter: N=29, a=2, b=9, K=12, theta0=105, alpha=0.01
% Tanggal : 2026-04-20
% ==========================================================

clc; clear; close all;

% Parameter Soal
a = 2; b = 9; theta0 = 105;

% Mendefinisikan Fasor
z1 = (a + 2) + (b + 1)*1i;  % 4 + 10i
z2 = (b + 1) - (a + 2)*1i;  % 10 - 4i

%% --- BAGIAN B: OPERASI DASAR ---
tambah = z1 + z2;
kali   = z1 * z2;
bagi   = z1 / z2;
jarak  = abs(z1 - z2);

disp('--- Hasil Operasi z1 dan z2 ---');
fprintf('z1 + z2 = %.2f + %.2fi\n', real(tambah), imag(tambah));
fprintf('z1 * z2 = %.2f + %.2fi\n', real(kali), imag(kali));
fprintf('z1 / z2 = %.2f + %.2fi\n', real(bagi), imag(bagi));
fprintf('|z1-z2| = %.4f\n\n', jarak);

%% --- BAGIAN E: PLOT AKAR KUBIK ---
% Menghitung 3 akar kubik dari w = 8 * cis(105)
r_w = 8;
sudut_w = deg2rad(theta0); % Konversi 105 ke radian

% Akar-akar (k = 0, 1, 2)
k = 0:2;
r_akar = r_w^(1/3); % Hasilnya 2
sudut_akar = (sudut_w + 2*pi*k) / 3;

% Mengubah ke koordinat kartesius untuk plotting
akar_kompleks = r_akar * exp(1i * sudut_akar);

% Membuat Plot Bidang Argand
figure;
compass(akar_kompleks, 'r'); % Menggambar jarum fasor
hold on;

% Menggambar lingkaran jari-jari 2 sebagai pembuktian
t = linspace(0, 2*pi, 100);
plot(2*cos(t), 2*sin(t), '--k'); 

grid on;
title('Plot Akar Kubik w = 8 cis(105^{\circ})');
xlabel('Re (Riil)'); ylabel('Im (Imajiner)');

% Menampilkan nilai akar di command window
disp('--- Tiga Akar Kubik w ---');
for n = 1:3
    fprintf('Akar %d: %.4f + %.4fi\n', n, real(akar_kompleks(n)), imag(akar_kompleks(n)));
end