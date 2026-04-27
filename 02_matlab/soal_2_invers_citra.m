% =========================================================
% UTS Matematika Sains Data - Semester Genap 2025/2026
% Soal 2 - Verifikasi Invers dan Visualisasi Citra
%
% Nama : Aulia Adzkia Rahmah
% NIM  : 2510514029
% Parameter : N=29, a=2, b=9, K=12
% Tanggal: 2026-04-20
% =========================================================

clc;
clear;
close all;

%% Matriks kunci
A = [3 9 2;
     1 4 9;
     9 1 5];

n = size(A,1);

% menyiapkan matriks kofaktor
C = zeros(n);

%% =========================
% Hitung kofaktor pakai loop
%% =========================
for i=1:n
    for j=1:n
        
        % salin A
        sub = A;
        
        % hapus baris i
        sub(i,:) = [];
        
        % hapus kolom j
        sub(:,j) = [];
        
        % rumus kofaktor
        C(i,j)=((-1)^(i+j))*det(sub);
        
    end
end

disp('Matriks Kofaktor C =')
disp(C)

%% Adjoin
AdjA = C';

disp('Matriks Adjoin =')
disp(AdjA)

%% Determinan
detA=det(A);

fprintf('det(A)= %.0f\n',detA)

%% Invers manual
A_inv_manual=AdjA/detA;

disp('A inverse manual =')
disp(A_inv_manual)

%% Invers MATLAB
A_inv=inv(A);

disp('A inverse inv(A) =')
disp(A_inv)

%% Cek selisih
disp('Selisih manual - inv(A) =')
disp(A_inv_manual-A_inv)

%% Error Frobenius
error_fro=norm(A_inv_manual-A_inv,'fro');

fprintf('Error Frobenius = %.15e\n',error_fro)

%% =========================
% Enkripsi citra
%% =========================

P=[120 79 200;
   80  4  39;
   59 90 170];

disp('Blok Piksel Asli P =')
disp(P)

E=A*P;

disp('Hasil Enkripsi E =')
disp(E)

%% Dekripsi
P_balik=A_inv_manual*E;

disp('Hasil Dekripsi P'' =')
disp(P_balik)

%% =========================
% Visualisasi citra
%% =========================

figure

subplot(1,2,1)
imshow(P,[])
title('Citra Asli')

subplot(1,2,2)
imshow(E,[])
title('Citra Enkripsi')

sgtitle('Visualisasi Blok Piksel - NIM Anda')

saveas(gcf,'visualisasi_enkripsi.png')