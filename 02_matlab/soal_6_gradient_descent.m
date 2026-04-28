% ==========================================================
% UTS Matematika Sains Data - Semester Genap 2025/2026
% Soal 6 - Optimasi Profit dengan Gradient Descent
% ----------------------------------------------------------
% Nama    : Aulia Adzkia Rahmah
% NIM     : 2510514029
% Parameter: a=2, b=9, K=12, alpha=0.01
% Tanggal : 2026-04-20
% ==========================================================

clc; clear; close all;

% Parameter Personalisasi
a = 2; b = 9; K = 12;
alpha_target = 0.01;      
iters = 500;              
x0 = 1;                   

% Solusi analitik dari poin 6.1 (c) 
x_analitik = 37.628556; 
pi_analitik = -3*x_analitik^3 + 168*x_analitik^2 + 100*x_analitik - 1440;

%% --- BAGIAN E: 500 ITERASI & PLOT KONVERGENSI ---

x_hist = zeros(iters, 1);
p_hist = zeros(iters, 1);
x_hist(1) = x0;

fprintf('--- Menjalankan 500 Iterasi Gradient Descent ---\n');

for k = 1:iters
    curr_x = x_hist(k);
    % Hitung Profit & Gradient manual tanpa @(x)
    p_hist(k) = -3*curr_x^3 + 168*curr_x^2 + 100*curr_x - 1440;
    grad = -9*curr_x^2 + 336*curr_x + 100;
    
    % Menampilkan progres di Command Window (Iterasi 0-4 dan tiap kelipatan 50)
    if k <= 5 || mod(k, 50) == 0
        fprintf('Iterasi %d: x = %.4f, Profit = %.4f\n', k-1, curr_x, p_hist(k));
    end
    
    if k < iters
        x_hist(k+1) = curr_x + alpha_target * grad;
        % Safety Break jika angka meledak (divergen)
        if abs(x_hist(k+1)) > 500
            fprintf('!! Divergen pada iterasi %d (Overshooting) !!\n', k);
            x_hist(k+1:end) = NaN; p_hist(k+1:end) = NaN;
            break; 
        end
    end
end

% --- PLOT KONVERGENSI (Profit vs Iterasi) ---
figure('Name', 'Poin E - Konvergensi');
plot(1:iters, p_hist, 'b', 'LineWidth', 2);
grid on; 
title('Grafik Konvergensi Profit \pi(x_k) vs Iterasi (k)');
xlabel('Iterasi (k)'); ylabel('Profit \pi(x)');

% --- PLOT KURVA PROFIT & TITIK OPTIMUM ---
figure('Name', 'Poin E - Perbandingan Titik');
f_pi = @(x) -3*x.^3 + 168*x.^2 + 100*x - 1440;
fplot(f_pi, [-10 60], 'k', 'LineWidth', 1); hold on;

% Plot Titik Awal (Hijau)
plot(x0, f_pi(x0), 'go', 'MarkerFaceColor', 'g', 'MarkerSize', 8); 
% Plot Titik Akhir GD (Merah)
idx_last = find(~isnan(x_hist), 1, 'last');
plot(x_hist(idx_last), f_pi(x_hist(idx_last)), 'rs', 'MarkerSize', 10, 'LineWidth', 2);
% Plot Solusi Analitik (Biru)
plot(x_analitik, pi_analitik, 'bx', 'MarkerSize', 12, 'LineWidth', 2);

grid on; 
title('Posisi Titik Optimum pada Kurva Profit');
xlabel('Harga x (ribu Rp)'); ylabel('Profit \pi(x)');
legend('Kurva Profit', 'Titik Awal (x_0)', 'Hasil GD (x*)', 'Solusi Analitik (c)');


%% --- BAGIAN F: ANALISIS SENSITIVITAS (3 LEARNING RATES) ---

alphas = [alpha_target, 10*alpha_target, 0.1*alpha_target];
labels = {'Normal (0.01)', 'Terlalu Besar (0.1)', 'Terlalu Kecil (0.001)'};
colors = {'b', 'r--', 'g-.'};

figure('Name', 'Poin F - Sensitivitas Alpha'); hold on;
for i = 1:3
    tx = x0; tp = zeros(iters, 1);
    for k = 1:iters
        tp(k) = -3*tx^3 + 168*tx^2 + 100*tx - 1440;
        g = -9*tx^2 + 336*tx + 100;
        tx = tx + alphas(i) * g;
        if abs(tx) > 1000, tp(k+1:end) = NaN; break; end
    end
    plot(1:iters, tp, colors{i}, 'LineWidth', 1.5);
end

grid on; ylim([-2e5, 2e5]);
title('Analisis Sensitivitas Learning Rate (\alpha)');
xlabel('Iterasi (k)'); ylabel('Profit \pi(x)');
legend(labels);

fprintf('\n--- Simulasi Selesai. Silakan cek Figure dan Command Window ---\n');