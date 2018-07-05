function accuracy=clusteringAcc(gnd,label)

label=bestMap(gnd,label);
accuracy=length(find(gnd == label))/length(gnd);

return