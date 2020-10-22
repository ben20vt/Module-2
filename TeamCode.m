%ENGE 1215 Fall 2020
%Professor: J. Case
%Editors: Group 9
%Date: 10/20/2020
%Project: Exploring Data with Programming

clear
clc
Response = 1;

while Response ~= 0
    close all;
    clear;
    clc;

%   IMPORTING DATA INTO TABLES
    globaltemps = readtable("global-climate-data.csv");
    nationaltemps = readtable("national-climate-data.csv");
    statetemps = readtable("state-climate-data.csv");
    
%   PUTTING COLUMNS INTO VECTORS
    Time1 = globaltemps.Var1;
    Temp1 = globaltemps.Var2;
    
    Time2 = nationaltemps.Var1;
    Temp2 = nationaltemps.Var2;
        
    Time3 = statetemps.Var1;
    Temp3 = statetemps.Var2;
    
%   DISPLAYING USER OPTIONS 
    disp('Please choose what information you would like to display:' );
    disp(' ');
    disp('1: The average temperature for a given year at the global, national, and state level ');
    disp('2: The change in average temperature between two years at the global, national, and state level ');
    disp('3: A graphical visualization of climate data at global, national, and state levels ');
    disp(' ');
    dec = input('What information would you like to display? Please enter a choice from 1-3: ');
    disp(' ');
    
%   FIRST DECISION: Get Avg Temp for Given Year and Display
    if dec == 1
        disp('You want the average temperature for a given year at the global, national, and state level: ');
        disp(' ');
        yearforavg = input('Please Enter a Year from 1895-2019: ');
        numforavg = (yearforavg-1894); %this is the index we will to extract year in table
        disp("The Average Global Temperature in " + yearforavg + " was " + Temp1(numforavg) + "°C");
        disp("The Average United States National Temperature in " + yearforavg + " was " + Temp2(numforavg) + "°C");
        disp("The Average Virginia State Temperature in " + yearforavg + " was " + Temp3(numforavg) + "°C");
        
%   SECOND DECISION: Get Temp for Given Years then Calculate and Display Changes
    elseif dec == 2
        disp('You want the change in average temperature between two years at the global, national, and state level');
        disp(' ');
        
        %user imput:
        yearforavg1 = input('Please Enter Year 1 (1895-2019): ');
        numforavg1 = (yearforavg1-1894);
        
        yearforavg2 = input('Please Enter Year 2 (1895-2019): ');
        numforavg2 = (yearforavg2-1894);
        
        %calculating change in temperatures:
        globalchange = (Temp1(numforavg2)-Temp1(numforavg1));
        nationalchange = (Temp2(numforavg2)-Temp2(numforavg1));
        statechange = (Temp3(numforavg2)-Temp3(numforavg1));
        
        %displaying changes:
        disp(' ');
        disp("The Change in Average Global Temperature between " + yearforavg1 + " and " + yearforavg2 + " is " + globalchange + "°C");
        disp("The Change in Average United States National Temperature between " + yearforavg1 + " and " + yearforavg2 + " is " + nationalchange + "°C");
        disp("The Change in Average Virginia State Temperature between " + yearforavg1 + " and " + yearforavg2 + " is " + statechange + "°C");
    
%   THIRD DECISION: Give User Choice of Which Graph to View
    elseif dec == 3
        
        %displaying user options:
        disp('Please choose what information you would like to graph:' );
        disp(' ')
        disp('1: The average temperature for a given year at the global level ');
        disp('2: The average temperature for a given year at the national level ');
        disp('3: The average temperature for a given year at the state level ');
        disp('4: The average temperature for a given year at all levels on separate graphs ');
        disp('5: The average temperature for a given year at all levels on one graph ');
        disp(' ');
    
        graphdec = input('What information would you like to display? Please enter a choice from 1-5: ');
        
        %FIRST CHOICE: Global Climate Over Time
        if graphdec == 1
            figure(1)
            
            %Plotting Graph:
            plot(Time1, Temp1,'s','MarkerFaceColor','b');
            hold on
            
            %Plotting Mathematical Model:
            BestFit = fit(Time1, Temp1, 'poly1');
            plot(BestFit);
            
            %Extras (Labels and Legend):
            title('Global Climate Over Time');
            xlabel('Year');
            ylabel('Temperature (°C)');
            legend('Global Temperature Data', 'Global Temperature Trendline');
            legend('Location','best')
            
            set(gca, 'FontName', 'Helvetica','FontSize',11);
            set(gca, 'Box', 'off', 'TickDir', 'out', 'TickLength', [.02 .02], ...
            'XMinorTick', 'on', 'YMinorTick', 'on', 'YGrid', 'on');
        
        %SECOND CHOICE: National Climate Over Time
        elseif graphdec == 2
            figure(2);
            
            %Plotting Graph:
            plot(Time2, Temp2, 's','MarkerFaceColor','b');
            hold on
            
            %Plotting Mathematical Model:
            BestFit = fit(Time2, Temp2, 'poly1');
            plot(BestFit)
            
            %Extras (Labels and Legend):
            title('US National Climate Over Time');
            xlabel('Year');
            ylabel('Temperature (°C)');
            legend('US Temperature Data', 'US Temperature Trendline');
            legend('Location','best')
            
            set(gca, 'FontName', 'Helvetica','FontSize',11);
            set(gca, 'Box', 'off', 'TickDir', 'out', 'TickLength', [.02 .02], ...
            'XMinorTick', 'on', 'YMinorTick', 'on', 'YGrid', 'on');
                
         %THIRD CHOICE: State Climate Over Time    
         elseif graphdec == 3
             figure( 3);
            
             %Plotting Graph:
             plot(Time3, Temp3, 's','MarkerFaceColor','b');
             hold on
             
             %Plotting Mathematical Model:
             BestFit = fit(Time3, Temp3, 'poly1');
             plot(BestFit)
             
             %Extras (Labels and Legend):
             title('Virginia Climate Over Time');
             xlabel('Year');
             ylabel('Temperature (°C)');
             legend('VA Temperature Data',  'VA Temperature Trendline');
             legend('Location','best')
             
             set(gca, 'FontName', 'Helvetica','FontSize',11);
             set(gca, 'Box', 'off', 'TickDir', 'out', 'TickLength', [.02 .02], ...
             'XMinorTick', 'on', 'YMinorTick', 'on', 'YGrid', 'on');
                
         %FOURTH CHOICE: Climate Data on Separate Graphs
         elseif graphdec == 4
             
           %GLOBAL GRAPH:
            figure(1)
            plot(Time1, Temp1,'s','MarkerFaceColor','b');
            hold on
            
            %Plotting Mathematical Model:
            BestFit1 = fit(Time1, Temp1, 'poly1');
            plot(BestFit1);
            
            %Extras (Labels and Legend):
            title('Global Climate Over Time');
            xlabel('Year');
            ylabel('Temperature (°C)');
            legend('Global Temperature Data', 'Global Temperature Trendline');
            legend('Location','best')
            
            set(gca, 'FontName', 'Helvetica','FontSize',11);
            set(gca, 'Box', 'off', 'TickDir', 'out', 'TickLength', [.02 .02], ...
            'XMinorTick', 'on', 'YMinorTick', 'on', 'YGrid', 'on');
             
           %NATIONAL GRAPH:
            figure(2)
            plot(Time2, Temp2, 's','MarkerFaceColor','b');
            hold on
            
            %Plotting Mathematical Model:
            BestFit2 = fit(Time2, Temp2, 'poly1');
            plot(BestFit2)
            
            %Extras (Labels and Legend):
            title('US Climate Over Time');
            xlabel('Year');
            ylabel('Temperature (°C)');
            legend('US Temperature Data', 'US Temperature Trendline');
            legend('Location','best')
            
            set(gca, 'FontName', 'Helvetica','FontSize',11);
            set(gca, 'Box', 'off', 'TickDir', 'out', 'TickLength', [.02 .02], ...
            'XMinorTick', 'on', 'YMinorTick', 'on', 'YGrid', 'on');
         
           %STATE GRAPH:
            figure(3)
            plot(Time3, Temp3, 's','MarkerFaceColor','b');
            hold on
             
            %Plotting Mathematical Model:
            BestFit3 = fit(Time3, Temp3, 'poly1');
            plot(BestFit3)
             
            %Extras (Labels and Legend):
            title('Virginia Climate Over Time');
            xlabel('Year');
            ylabel('Temperature (°C)');
            legend('VA Temperature Data',  'VA Temperature Trendline');
            legend('Location','best')
             
            set(gca, 'FontName', 'Helvetica','FontSize',11);
            set(gca, 'Box', 'off', 'TickDir', 'out', 'TickLength', [.02 .02], ...
            'XMinorTick', 'on', 'YMinorTick', 'on', 'YGrid', 'on');
        
         %FIFTH CHOICE: All Climate Data On One Graph
         elseif graphdec == 5
             figure(4)
             
             %Plotting Global Data and Trend
             plot(Time1, Temp1,'x','MarkerFaceColor','b');
             hold on
             BestFit1 = fit(Time1, Temp1, 'poly1');
             plot(BestFit1,'r')
             
             %Plotting National Data and Trend
             plot(Time2, Temp2,'*','MarkerFaceColor','y');
             hold on
             BestFit2 = fit(Time2, Temp2, 'poly1');
             plot(BestFit2,'b')
             
             %Plotting National Data and Trend
             plot(Time3, Temp3,'+','MarkerFaceColor','g');
             hold on
             BestFit = fit(Time3, Temp3, 'poly1');
             plot(BestFit,'m')
             
             %Extras (Labels and Legend):
             title('Global, US National, and Virginia State Climate Over Time');
             xlabel('Year');
             ylabel('Temperature (°C)');
             legend('Global Temperature Data', 'Global Temperature Trendline', 'US Temperature Data',  'US Temperature Trendline', 'VA Temperature Data', 'VA Temperature Trendline');
             legend('Location','best')
             
             set(gca, 'FontName', 'Helvetica','FontSize',11);
             set(gca, 'Box', 'off', 'TickDir', 'out', 'TickLength', [.02 .02], ...
            'XMinorTick', 'on', 'YMinorTick', 'on', 'YGrid', 'on');
         end
   
    end
    disp(' ');
    Response = input("Would you like to return to the top menu? Please enter any value to continue, or 0 to exit: ")';
end
