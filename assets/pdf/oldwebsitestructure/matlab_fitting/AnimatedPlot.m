function[aviobj]=animatedPlot(Vx,Vy,video,filename)

%Vx is the voltage read in the x-direction
%Vy is the voltage read in the y-direction
%This function will give you an animated plot of Vx vs Vy. That is it will
%show you the path that a particle takes in increments set by the pause
%function, although it seems there is a max speed set by the plot function

%if you want to save the animation type 'on' for video and give your file a
%name, otherwise just write 'off' 



for j=1:4:(length(Vx))%down sample data set in order to make animation faster
    Vx_new((j+3)/4)=Vx(j);
    Vy_new((j+3)/4)=Vy(j);
end

    if strcmp (video,'on')%the animation will be saved in a given filename if this is true
        aviobj = avifile([filename '.avi'],'fps',30);
        aviobj.compression='cinepak'
    else
    end
for i=1:length(Vx_new)%makes the animation
    plot(Vx_new(i),Vy_new(i),'ro');
    hold on
   
    if i>2
        plot(Vx_new(1:i-2),Vy_new(1:i-2),'g')
        plot(Vx_new(i-2:i),Vy_new(i-2:i),'r')
       
    else
        plot(Vx_new(1:i),Vy_new(1:i),'r')
       
    end
    hold off
    grid on
    %sets the axis of the figure
    xmax=ceil(max(abs(Vx_new)));
    ymax=ceil(max(abs(Vy_new)));
    axis([-xmax xmax -ymax ymax]);
    axis fill
    axis on
    xlabel('Vx (Volts)')
    ylabel('Vy (Volts)')
    title(sprintf('Trajectory of trapped object at time =  %0.5g seconds',i/250))
    pause(.01);
    if strcmp(video,'on')%saves the animation as a avi if this is true
        frame = getframe(gcf);
        aviobj = addframe(aviobj,frame);
    else
    end
end
if strcmp(video,'on')
    aviobj = close(aviobj);
    disp(['Animation saved in current Directory'])
else
end
end