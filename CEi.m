function [x] =Ei(T) 
%% T:Temperature(°C）x:stress(MKp)
    if T<=-7.726
        x =6.71;
    elseif T>=-1.831
        x =0;
    else
        x =-0.319*T+3.856;
    end
    
  
end