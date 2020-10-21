figure(1)
globaltemps = readtable("global-climate-data.csv"); 
Time1 = globaltemps.Var1;  
Temp1 = globaltemps.Var2; 
plot(Time1, Temp1, 'x');  
BestFit = fit(Time1, Temp1, 'poly1'); 
hold on    
plot(BestFit) 
title('Global Climate Data');  
xlabel('Year');    
ylabel('Temperature');  
figure(2)
nationaltemps = readtable("national-climate-data.csv"); 
Time2 = nationaltemps.Var1;  
Temp2 = nationaltemps.Var2; 
plot(Time2, Temp2, 'x');  
BestFit = fit(Time2, Temp2, 'poly1'); 
hold on    
plot(BestFit) 
title('National Climate Data');  
xlabel('Year');    
ylabel('Temperature');  
figure(3)
statetemps = readtable("state-climate-data.csv"); 
Time3 = statetemps.Var1;  
Temp3 = statetemps.Var2; 
plot(Time3, Temp3, 'x');  
BestFit = fit(Time3, Temp3, 'poly1'); 
hold on    
plot(BestFit) 
title('State Climate Data');  
xlabel('Year');    
ylabel('Temperature');  
