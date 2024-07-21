clc, clearvars, close all;
sheet = 12;
data_all = xlsread('Cluster_Data_HDBSCAN.xlsx', sheet);
data = data_all(:,4);

p = 3;  % You can adjust this based on your data or use model selection criteria.

% Use the aryule function to estimate AR coefficients
ar_coefficients = aryule(data, p);

% You can use the filter function to make predictions
n = length(data);
[AR_pred, ~] = filter(-ar_coefficients, 1, data);  % Predicted values

% Plot the original data and the predictions
figure(1);
plot(data, 'linewidth', 2);
hold on;
plot(AR_pred, 'linewidth', 2);
xlabel('Time');
ylabel('Value');
title('AR Model Predictions');

% Evaluate the model, e.g., 
mse = mean((AR_pred - data).^2);
disp(['Mean Squared Error: ' num2str(mse)]);


%%
clc, clearvars, close all;
sheet = 12;
data_all = xlsread('Cluster_Data_HDBSCAN.xlsx', sheet);
data = data_all(:,4);

p = 5;  % You can adjust this based on your data or use model selection criteria.

% Use the aryule function to estimate AR coefficients
ar_coefficients = aryule(data, p);

% You can use the filter function to make predictions
n = length(data);
[AR_pred, ~] = filter(-ar_coefficients, 1, data);  % Predicted values

% Plot the original data and the predictions
figure(1);
plot(data(p+1:end), 'linewidth', 2);
hold on;
plot(AR_pred(p+1:end), 'linewidth', 2);
xlabel('Time');
ylabel('Value');
title('AR Model Predictions');33

% Evaluate the model, e.g., 
mse = mean((AR_pred(p+1:end) - data(p+1:end)).^2);
disp(['Mean Squared Error: ' num2str(mse)]);
