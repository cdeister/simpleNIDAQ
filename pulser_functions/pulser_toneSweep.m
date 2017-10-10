function [outTone,outTime]=pulser_toneSweep(sampleRate,startFreq,endFreq,sweepTime,riseTime,fallTime)

% Make a linearly modulated tone

sInt=1/sampleRate;
linearToneSlope=(endFreq-startFreq)/sweepTime;
toneInterval=linearToneSlope*sInt;
linearWave=startFreq:toneInterval:endFreq-toneInterval;
outTime=0:sInt:0.5-sInt;
outTone=sin(linearWave.*outTime);
shapeWave=ones(size(outTone));

riseCount=sampleRate*riseTime;
riseEdge=0:1/riseCount:1;

fallCount=sampleRate*fallTime;
fallEdge=fliplr(0:1/fallCount:1);

shapeWave(1,1:numel(riseEdge))=riseEdge;
shapeWave(1,end-(numel(fallEdge)-1):end)=fallEdge;

outTone=outTone.*shapeWave;

end