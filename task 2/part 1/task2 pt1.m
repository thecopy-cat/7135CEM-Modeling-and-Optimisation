% Create a new Mamdani fuzzy inference system
fis = mamfis('Name', 'AssistiveCareFLC');

% Add input variable for Temperature
fis = addInput(fis, [0 40], 'Name', 'Temperature');
fis = addMF(fis, 'Temperature', 'trimf', [0 0 10], 'Name', 'Cold');
fis = addMF(fis, 'Temperature', 'trimf', [5 15 25], 'Name', 'Comfortable');
fis = addMF(fis, 'Temperature', 'trimf', [20 40 40], 'Name', 'Hot');

% Add input variable for Lighting
fis = addInput(fis, [0 100], 'Name', 'Lighting');
fis = addMF(fis, 'Lighting', 'trimf', [0 0 30], 'Name', 'Dim');
fis = addMF(fis, 'Lighting', 'trimf', [20 50 80], 'Name', 'Moderate');
fis = addMF(fis, 'Lighting', 'trimf', [70 100 100], 'Name', 'Bright');

% Add input variable for Humidity
fis = addInput(fis, [0 100], 'Name', 'Humidity');
fis = addMF(fis, 'Humidity', 'trimf', [0 0 30], 'Name', 'Dry');
fis = addMF(fis, 'Humidity', 'trimf', [20 50 80], 'Name', 'Comfortable');
fis = addMF(fis, 'Humidity', 'trimf', [70 100 100], 'Name', 'Humid');

% Add output variable for Heater
fis = addOutput(fis, [0 100], 'Name', 'Heater');
fis = addMF(fis, 'Heater', 'trimf', [0 0 50], 'Name', 'Low');
fis = addMF(fis, 'Heater', 'trimf', [30 70 100], 'Name', 'Medium');
fis = addMF(fis, 'Heater', 'trimf', [70 100 100], 'Name', 'High');

% Add output variable for Light
fis = addOutput(fis, [0 100], 'Name', 'Light');
fis = addMF(fis, 'Light', 'trimf', [0 0 50], 'Name', 'Low');
fis = addMF(fis, 'Light', 'trimf', [30 70 100], 'Name', 'Medium');
fis = addMF(fis, 'Light', 'trimf', [70 100 100], 'Name', 'High');

% Add output variable for Humidifier
fis = addOutput(fis, [0 100], 'Name', 'Humidifier');
fis = addMF(fis, 'Humidifier', 'trimf', [0 0 50], 'Name', 'Low');
fis = addMF(fis, 'Humidifier', 'trimf', [30 70 100], 'Name', 'Medium');
fis = addMF(fis, 'Humidifier', 'trimf', [70 100 100], 'Name', 'High');

% Define fuzzy rules
rules = [
    "If Temperature is Cold then Heater is High";
    "If Temperature is Comfortable then Heater is Medium";
    "If Temperature is Hot then Heater is Low";
    "If Lighting is Dim then Light is High";
    "If Lighting is Moderate then Light is Medium";
    "If Lighting is Bright then Light is Low";
    "If Humidity is Dry then Humidifier is High";
    "If Humidity is Comfortable then Humidifier is Medium";
    "If Humidity is Humid then Humidifier is Low";
];

fis = addRule(fis, rules);

% Display FIS structure
figure
plotfis(fis)

% View the rule viewer (you can replace this with the Fuzzy Logic Designer app)
figure
ruleview(fis)

% View the control surface plot for Heater output
figure
gensurf(fis, [1 2], 1)

% View the control surface plot for Light output
figure
gensurf(fis, [1 2], 2)

% View the control surface plot for Humidifier output
figure
gensurf(fis, [1 3], 3)

% Test FIS with an example input
input = [15 40 20]; % Example input: [Temperature, Lighting, Humidity]
output = evalfis(fis, input);
disp(['Heater level: ', num2str(output(1))]);
disp(['Light level: ', num2str(output(2))]);
disp(['Humidifier level: ', num2str(output(3))]);