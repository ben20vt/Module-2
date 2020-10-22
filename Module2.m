clear
clc
disp('Please choose what information you would like to display:' );
disp('1: The average temperature for a given year at the global, national, and state level ');
disp('2: The change in average temperature between two years at the global, national, and state level ');
disp('3: A graphical visualization of climate data at global, national, and state levels ');
dec = input('What information would you like to display? Please enter a choice from 1-3: ');
if dec == 1
    globaltemps = readtable("global-climate-data.csv");
    nationaltemps = readtable("national-climate-data.csv");
    statetemps = readtable("state-climate-data.csv");
    yearforavg = input('Year (1895-2019): ');
    numforavg = (yearforavg-1894);
    disp("The Average Global Temperature in " + yearforavg + " was " + globaltemps.Var2(numforavg) + "°C");
    disp("The Average National Temperature in " + yearforavg + " was " + nationaltemps.Var2(numforavg) + "°C");
    disp("The Average State Temperature in " + yearforavg + " was " + statetemps.Var2(numforavg) + "°C");
elseif dec == 2
    globaltemps = readtable("global-climate-data.csv");
    nationaltemps = readtable("national-climate-data.csv");
    statetemps = readtable("state-climate-data.csv");
    yearforavg1 = input('Year 1 (1895-2019): ');
    numforavg1 = (yearforavg1-1894);
    yearforavg2 = input('Year 2 (1895-2019): ');
    numforavg2 = (yearforavg2-1894);
    globalchange = (globaltemps.Var2(numforavg2)-globaltemps.Var2(numforavg1));
    nationalchange = (nationaltemps.Var2(numforavg2)-nationaltemps.Var2(numforavg1));
    statechange = (statetemps.Var2(numforavg2)-statetemps.Var2(numforavg1));
    disp("The Change in Average Global Temperature between " + yearforavg1 + " and " + yearforavg2 + " is " + globalchange + "°C");
    disp("The Change in Average National Temperature between " + yearforavg1 + " and " + yearforavg2 + " is " + nationalchange + "°C");
    disp("The Change in Average State Temperature between " + yearforavg1 + " and " + yearforavg2 + " is " + statechange + "°C");
elseif dec == 3
    disp('Please choose what information you would like to graph:' );
    disp('1: The average temperature for a given year at the global level ');
    disp('2: The average temperature for a given year at the national level ');
    disp('3: The average temperature for a given year at the state level ');
    disp('4: The average temperature for a given year at all levels on separate graphs ');
    disp('5: The average temperature for a given year at all levels on one graph ');
    graphdec = input('What information would you like to display? Please enter a choice from 1-5: ');
        if graphdec == 1
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
            ylabel('Temperature (°C)');
            legend('Global Temperature Data', 'Global Temperature Trendline');
            legend('Location','best')
        elseif graphdec == 2
            figure(2);
            nationaltemps = readtable("national-climate-data.csv");
            Time2 = nationaltemps.Var1;
            Temp2 = nationaltemps.Var2;
            plot(Time2, Temp2, 'x');
            BestFit = fit(Time2, Temp2, 'poly1');
            hold on
            plot(BestFit)
            title('National Climate Data');
            xlabel('Year');
            ylabel('Temperature (°C)');
            legend('National Temperature Data', 'National Temperature Trendline');
            legend('Location','best')
        elseif graphdec == 3
            figure( 3);
            statetemps = readtable("state-climate-data.csv");
            Time3 = statetemps.Var1;
            Temp3 = statetemps.Var2;
            plot(Time3, Temp3, 'x');
            BestFit = fit(Time3, Temp3, 'poly1');
            hold on
            plot(BestFit)
            title('State Climate Data');
            xlabel('Year');
            ylabel('Temperature (°C)');
            legend('State Temperature Data',  'State Temperature Trendline');
            legend('Location','best')
        elseif graphdec == 4
            figure(4)
            globaltemps = readtable("global-climate-data.csv");
            Time1 = globaltemps.Var1;
            Temp1 = globaltemps.Var2;
            plot(Time1, Temp1, 'x');
            BestFit = fit(Time1, Temp1, 'poly1');
            hold on
            plot(BestFit)
            title('Global Climate Data');
            xlabel('Year');
            ylabel('Temperature (°C)');
            legend('Global Temperature Data', 'Global Temperature Trendline');
            legend('Location','best')
            figure(5)
            nationaltemps = readtable("national-climate-data.csv");
            Time2 = nationaltemps.Var1;
            Temp2 = nationaltemps.Var2;
            plot(Time2, Temp2, 'x');
            BestFit = fit(Time2, Temp2, 'poly1');
            hold on
            plot(BestFit)
            title('National Climate Data');
            xlabel('Year');
            ylabel('Temperature (°C)');
            legend('National Temperature Data', 'National Temperature Trendline');
            legend('Location','best')
            figure(6)
            statetemps = readtable("state-climate-data.csv");
            Time3 = statetemps.Var1;
            Temp3 = statetemps.Var2;
            plot(Time3, Temp3, 'x');
            BestFit = fit(Time3, Temp3, 'poly1');
            hold on
            plot(BestFit)
            title('State Climate Data');
            xlabel('Year');
            ylabel('Temperature (°C');
            legend('State Temperature Data', 'State Temperature Trendline');
            legend('Location','best')
        elseif graphdec == 5
            figure(7)
            %global graph
            globaltemps = readtable("global-climate-data.csv");
            Time1 = globaltemps.Var1;
            Temp1 = globaltemps.Var2;
            plot(Time1, Temp1, 'x');
            BestFit = fit(Time1, Temp1, 'poly1');
            hold on
            plot(BestFit)
            %national graph
            nationaltemps = readtable("national-climate-data.csv");
            Time2 = nationaltemps.Var1;
            Temp2 = nationaltemps.Var2;
            plot(Time2, Temp2, 'x');
            BestFit = fit(Time2, Temp2, 'poly1');
            hold on
            plot(BestFit)
            %state graph
            statetemps = readtable("state-climate-data.csv");
            Time3 = statetemps.Var1;
            Temp3 = statetemps.Var2;
            plot(Time3, Temp3, 'x');
            BestFit = fit(Time3, Temp3, 'poly1');
            hold on
            plot(BestFit)
            title('Climate Data');
            xlabel('Year');
            ylabel('Temperature (°C)');
            legend('Global Temperature Data', 'Global Temperature Trendline', 'National Temperature Data',  'National Temperature Trendline', 'State Temperature Data', 'State Temperature Trendline');
            legend('Location','best')
        end
end




