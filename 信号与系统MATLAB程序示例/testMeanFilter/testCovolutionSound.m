[sound,fs] = audioread('segment2.wav');
sound = sound(:,1);
t = 0:1/fs:(length(sound)-1)/fs;
plot(t,sound);
h = ones(1,100);
h = h/length(h);
newSound = conv(sound,h);
t = 0:1/fs:(length(newSound)-1)/fs;
plot(t,newSound)
audiowrite('testMeanFilter.wav',newSound,fs);
