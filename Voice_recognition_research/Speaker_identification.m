clc; clear; close all;

%% ============================
% 1. RECORD SPEAKER FILES
% ============================

% --- Record Speaker 1 ---
disp('Recording SPEAKER 1 (3 seconds)...');
recObj = audiorecorder(44100, 16, 1);
recordblocking(recObj, 3);
audio1 = getaudiodata(recObj);
audiowrite('speaker1.wav', audio1, 44100);
disp('Speaker 1 saved.');

% --- Record Speaker 2 ---
disp('Recording SPEAKER 2 (3 seconds)...');
recObj = audiorecorder(44100, 16, 1);
recordblocking(recObj, 3);
audio2 = getaudiodata(recObj);
audiowrite('speaker2.wav', audio2, 44100);
disp('Speaker 2 saved.');

%% ============================
% 2. LOAD + PLOT AUDIO
% ============================

[audio1, Fs1] = audioread('speaker1.wav');
[audio2, Fs2] = audioread('speaker2.wav');

figure;
subplot(2,1,1);
plot(audio1); title('Speaker 1 Waveform');

subplot(2,1,2);
plot(audio2); title('Speaker 2 Waveform');

%% ============================
% 3. EXTRACT MFCC FEATURES
% ============================

mfcc1 = getMFCC(audio1, Fs1);
mfcc2 = getMFCC(audio2, Fs2);

figure;
subplot(2,1,1);
imagesc(mfcc1'); title('MFCCs Speaker 1');

subplot(2,1,2);
imagesc(mfcc2'); title('MFCCs Speaker 2');

%% ============================
% 4. SPEAKER IDENTIFICATION
% ============================

disp('Recording UNKNOWN speaker (3s)...');
recObj = audiorecorder(44100, 16, 1);
recordblocking(recObj, 3);
unknownAudio = getaudiodata(recObj);
audiowrite('unknown.wav', unknownAudio, 44100);

unknownMFCC = getMFCC(unknownAudio, 44100);

dist1 = dtw(mfcc1, unknownMFCC);
dist2 = dtw(mfcc2, unknownMFCC);

disp(['Distance to Speaker 1: ', num2str(dist1)]);
disp(['Distance to Speaker 2: ', num2str(dist2)]);

if dist1 < dist2
    disp('IDENTIFICATION RESULT:wow Unknown is SPEAKER 1');
else
    disp('IDENTIFICATION RESULT: hey Unknown is SPEAKER 2');
end

%% ============================
% 5. SPEAKER VERIFICATION
% ============================

claimedSpeakerMFCC = mfcc1; % Claim: I'm speaker 1
verificationDist = dtw(claimedSpeakerMFCC, unknownMFCC);

threshold = 50;

if verificationDist < threshold
    disp('VERIFICATION: SUCCESS – identified speaker 1');
else
    disp('VERIFICATION: FAILED – Not speaker 1');
end

%% ===============================
% 6. REAL-TIME LIVE IDENTIFICATION
% ===============================

disp('Real-time recognition: speak now (3s)...');
recObj = audiorecorder(44100, 16, 1);
recordblocking(recObj, 3);
liveAudio = getaudiodata(recObj);

liveMFCC = getMFCC(liveAudio, 44100);

liveDist1 = dtw(mfcc1, liveMFCC);
liveDist2 = dtw(mfcc2, liveMFCC);

if liveDist1 < liveDist2
    disp('LIVE RESULT: Identified Speaker 1');
else
    disp('LIVE RESULT: You are Speaker 2');
end
