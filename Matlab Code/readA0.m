x=0;
while 1
        b = a.analogRead(1);
        x = [x b];
        plot(x,'LineWidth',2);
        drawnow;
end
% for j=1:3161
%     total=0;
%     for i=1:300
%         total=total+data(1,300*(j-1)+i)/300;
%         i=i+1;
%     end
%     p(1,j)=total;
%     j=j+1;
% end
for j=1:3161
    total=0;
    for i=1:300
        total=total+template(1,300*(j-1)+i)/300;
        i=i+1;
    end
    q(1,j)=total;
    j=j+1;
end



% for i=1:220000
%     data(1,i)=offthebed(1,i);
%     i=i+1;
% end
% for i=1:220000
%     template(1,i)=0;
%     i=i+1;
% end
% for i=220001:440000  
%     data(1,i)=onthebed(1,i-220000);
%     i=i+1;
% end
% for i=220001:440000
%     template(1,i)=1;
%     i=i+1;
% end
% for i=440001:521540
%     data(1,i)=bodymovement(1,i-440000);
%     i=i+1;
% end
% for i=440001:521540
%     template(1,i)=2;
%     i=i+1;
% end
% for i=521541:727712
%     data(1,i)=onthebed(1,i-301540);
%     i=i+1;
% end
% for i=521541:727712
%     template(1,i)=1;
%     i=i+1;
% end
% for i=727713:948445
%     data(1,i)=offthebed(1,i-507712);
%     i=i+1;
% end
% for i=727713:948445
%     template(1,i)=0;
%     i=i+1;
% end