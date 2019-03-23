interval = 500;
limit = 1000;
s = 1;
t = 1;
data = 0;
final = 0;
for s = 1:limit
    while(t < interval)
        b = a.analogRead(0);
        data = [data b];
        t = t + 1;
    end
    t = 0;
    j =3;
    L=500;
    result = sum(abs(data(1+j+j:L)-2*data(1+j:L-j)+data(1:L-j-j)));
    final = [final result];
    plot(final);
    set(gca,'xlimmode','auto','ylim',[1000 10000]);
    drawnow;
    s = s+1;
    data = 0;
end
