%Guitar Tuner Program
%Sushil Bala
% Vighnesh M
% Pramod K
% Andrew John
% close all;
clear all;
clc;
z=input('Enter the file name');
tic;
while toc<1
[notesig,fs] = audioread(z.string);
n = length(notesig)-1;
f = 0:fs/n:fs;
bh = blackmanharris(n+1); %Blackman-Harris Window
h = hanning(n+1); %Hanning Window
%Windowing
notesig = notesig(:,1).*bh.*h;
%plot(notesig);title('Incoming Signal');
%fundamental frequency
E2f = 82.4069;
A2f = 110;
D3f = 146.832;
G3f = 195.998;
B3f = 246.942; 
15
E4f = 329.628;
%bounds for frequency filters
E2A2 = mean([E2f A2f]);
A2D3 = mean([A2f D3f]);
D3G3 = mean([D3f G3f]);
G3B3 = mean([G3f B3f]);
B3E4 = mean([B3f E4f]);
%frequency filters
E2filter = (1.*(f<E2A2).*(f>69))';
A2filter = (1.*(f>E2A2).*(f<A2D3))';
D3filter = (1.*(f>A2D3).*(f<D3G3))';
G3filter = (1.*(f>D3G3).*(f<G3B3))';
B3filter = (1.*(f>G3B3).*(f<B3E4))';
E4filter = (1.*(f>B3E4).*(f<350))';
%FFT
y = abs(fft(notesig));
sigFFT = y(:,1); %extract one column
if(max(E2filter.*sigFFT)> 500)
disp('E2')
filtSig = E2filter.*sigFFT;
[fundAmp, sample_loc] = max(filtSig);
if(sample_loc*fs/n < E2f-1.5)
disp('Tune up');
disp('Difference:');
disp(E2f-1.5-(sample_loc*fs/n));
elseif(E2f+1.5 < sample_loc*fs/n)
disp('Tune down');
disp('Difference:');
disp((sample_loc*fs/n)-E2f+1.5); 
16
else
disp('Nice, In Tune Bro');
end
elseif(max(A2filter.*sigFFT)> 1000)
disp('A2');
filtSig = A2filter.*sigFFT;
[fundAmp, sample_loc] = max(filtSig);
if(sample_loc*fs/n < A2f-1.5)
disp('Tune up');
disp('Difference:');
disp(A2f-1.5-(sample_loc*fs/n));
elseif(A2f+1.5 < sample_loc*fs/n)
disp('Tune down');
disp('Difference:');
disp((sample_loc*fs/n)-A2f+1.5);
else
disp('Nice, In Tune Bro');
end
elseif(max(D3filter.*sigFFT)> 1000)
disp('D3');
filtSig = D3filter.*sigFFT;
[fundAmp, sample_loc] = max(filtSig);
if(sample_loc*fs/n < D3f-1.5)
disp('Tune up');
disp('Difference:');
disp(D3f-1.5-(sample_loc*fs/n));
elseif(D3f+1.5 < sample_loc*fs/n)
disp('Tune down');
disp('Difference:');
disp((sample_loc*fs/n)-D3f+1.5);
else
disp('Nice, In Tune Bro'); 
17
end
elseif(max(G3filter.*sigFFT)> 1000)
disp('G3');
filtSig = G3filter.*sigFFT;
[fundAmp, sample_loc] = max(filtSig);
if(sample_loc*fs/n < G3f-1.5)
disp('Tune up');
disp('Difference:');
disp(G3f-1.5-(sample_loc*fs/n));
elseif(G3f+1.5 < sample_loc*fs/n)
disp('Tune down');
disp('Difference:');
disp((sample_loc*fs/n)-G3f+1.5);
else
disp('Nice, In Tune Bro');
end
elseif(max(B3filter.*sigFFT)> 1000)
disp('B3');
filtSig = B3filter.*sigFFT;
[fundAmp, sample_loc] = max(filtSig);
if(sample_loc*fs/n < B3f-1.5)
disp('Tune up');
disp('Difference:');
disp(B3f-1.5-(sample_loc*fs/n));
elseif(B3f+1.5 < sample_loc*fs/n)
disp('Tune down');
disp('Difference:');
disp((sample_loc*fs/n)-B3f+1.5);
else
disp('Nice, In Tune Bro');
end
elseif(max(E4filter.*sigFFT)> 1000) 
18
disp('E4');
filtSig = E4filter.*sigFFT;
[fundAmp, sample_loc] = max(filtSig);
if(sample_loc*fs/n < E4f-1.5)
disp('Tune up');
disp('Difference:');
disp(E4f-1.5-(sample_loc*fs/n));
elseif(E4f+1.5 < sample_loc*fs/n)
disp('Tune down');
disp('Difference:');
disp((sample_loc*fs/n)-E4f+1.5);
else
disp('Nice, In Tune Bro');
end
end
end
