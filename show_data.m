% NOVA School of Science and Technology
% Department of Electrical and Computer Engineering
% IEEC course, fall 2021
% Bruno Guerreiro (bj.guerreiro@fct.unl.pt)

% Summary: script that plots basic simulation results

    sstgreen        = [43,191,92]/255;
    sstblue         = [0,128,255]/255;
    
    z = x(3,1:end-1);
    z_ref = x_ref(3,1:end);
    
    if exist('h11','var') && exist('h12','var')
        figure(100);
        hold on;
        plot(t,u(3,:));
        hold off;
        n = length(LegStrsU);
        LegStrsU{n+1} = strcat('u_',num2str(n),' (kp=',num2str(kp),' , kv=',num2str(kv),' )');
        legend(LegStrsU);
        
        figure(101);
        hold on;
        plot(t,z);
        hold off;
        ax = axis();
        axis([ax(1:2),min(0,ax(3)),max(3,ax(4))]);
        n = length(LegStrs);
        LegStrs{n+1} = strcat('z_',num2str(n),' (kp=',num2str(kp),' , kv=',num2str(kv),' )');
        legend(LegStrs);
    else
        figure(100);
        h01 = plot(t,u(3,:),'Color',sstblue);
        grid on;
        xlabel('time [s]');
        ylabel('u(t) [N]');
        LegStrsU={strcat('u_1 (kp=',num2str(kp),' , kv=',num2str(kv),' )')};
        legend(LegStrsU);
        
        figure(101);
        h11 = plot(t,z_ref,'Color',sstgreen);
        grid on;
        hold on;
        h12 = plot(t,z);  
        hold off;
        xlabel('time [s]');
        ylabel('Drone height [m]');
        ax = axis();
        axis([ax(1:2),min(0,ax(3)),max(3,ax(4))]);
        LegStrs={'z_{ref}',strcat('z_1 (kp=',num2str(kp),' , kv=',num2str(kv),' )')};
        legend(LegStrs);
    end
