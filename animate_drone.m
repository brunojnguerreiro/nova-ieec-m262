% NOVA School of Science and Technology
% Department of Electrical and Computer Engineering
% IEEC course, fall 2021
% Bruno Guerreiro (bj.guerreiro@fct.unl.pt)

% Summary: script to animate drone based on simulation data

    sstblue         = [0,128,255]/255;
    sstlightblue    = [48,208,216]/255;
    sstgreen        = [43,191,92]/255;
    
    N = length(t);
    dt = mean(t(2:end)-t(1:end-1));
    
    figure(102);
    p = x(1:3,1:2);
    p_ini = x(1:3,1);
    p_end = x_ref(1:3,end);
    hini = plot3(p_ini(1,:),p_ini(2,:),p_ini(3,:),'o','Color',sstblue,'MarkerSize',2);
    hold on;
    hend = plot3(p_end(1,:),p_end(2,:),p_end(3,:),'x','Color',sstgreen,'MarkerSize',2);
    hp = plot3(p(1,:),p(2,:),p(3,:),'-','Color',sstlightblue);
    hd = plot_drone(p(:,end),lbd(:,end));
    hold off;
    grid on;
    axis equal;
    axis([-1.2 1.2 -1.2 1.2 0 3]);
    xlabel('x [m]');
    ylabel('y [m]');
    zlabel('z [m]');
    legend('start','end','trajectory');
    for k = 2:2:N
        p = x(1:3,1:k);
        p_ref = x_ref(1:3,1:k);
        lbd = lbd_full(:,1:k);
        set(hp,'xdata',p(1,:),'ydata',p(2,:),'zdata',p(3,:));
        plot_drone(p(:,end),lbd(:,end),hd);
        axis equal;
        drawnow;
        %pause(dt/10);
    end

%endfunction