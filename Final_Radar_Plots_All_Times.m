% Radar Plot Generator for NG and MG with Color-Blind Friendly Colors

% Define properties (6 features)
properties = {'σCyto (S/m)', 'Gmem (S/m²)', 'Cspmem (mF/m²)', ...
              'ϕ', 'fxo1 (KHz)', 'fxo2 (MHz)'};

theta = linspace(0, 2*pi, length(properties)+1); % for radar loop

% Color-blind–friendly palette (Wong 2011)
groupColors = [
    0,   158, 115;   % Green       - 0 hr NG
    230, 159, 0;     % Orange      - 3 hr NG
    86,  180, 233;   % Blue        - 6 hr NG
    213, 94,  0;     % Vermillion  - 3 hr SMG
    204, 121, 167    % Purple      - 6 hr SMG
] / 255;

% Data for each group (trimmed to 6 values to match properties)
cond100_0NG   = [1.0000, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000];
cond100_3NG   = [0.1682, 0.3621, 0.1841, 0.1841, 0.0000, 0.1996];
cond100_3SMG  = [0.0834, 0.4175, 0.3757, 0.3757, 0.0000, 0.1047];
cond100_6NG   = [0.0000, 1.0000, 1.0000, 1.0000, 0.0000, 0.1469];
cond100_6SMG  = [0.1198, 0.9507, 0.4025, 0.4025, 0.0000, 0.0000];

% Group data and styles
groupData = {cond100_0NG, cond100_3NG, cond100_6NG, cond100_3SMG, cond100_6SMG};
lineStyles = {'-', '--', ':', '-.', ':'};
labels = {'0 hr NG', '3 hr NG', '6 hr NG', '3 hr SMG', '6 hr SMG'};

% --- PLOTTING ---
figure('Color', 'w'); % white background
hold on;
axis equal;
axis off;

% Grid (radial rings)
num_rings = 4;
for r = linspace(0.25, 1, num_rings)
    [xg, yg] = pol2cart(theta, r * ones(size(theta)));
    plot([xg, xg(1)], [yg, yg(1)], 'Color', [0.85 0.85 0.85], 'LineWidth', 1);
end

% Spokes and feature labels
for i = 1:length(properties)
    [xs, ys] = pol2cart([0, theta(i)], [0, 1]);
    plot(xs, ys, 'Color', [0.85 0.85 0.85], 'LineWidth', 1);
    [lx, ly] = pol2cart(theta(i), 1.2);
    text(lx, ly, properties{i}, 'HorizontalAlignment', 'center', ...
         'FontSize', 14, 'FontWeight', 'bold', 'Color', [0.15 0.15 0.15]);
end

% Plot each group as a filled radar polygon and add circle markers on vertices
plotHandles = gobjects(1, 5);
markerSize = 8;
for k = 1:5
    data = groupData{k};
    dataClosed = [data, data(1)];  % Close the loop
    [x, y] = pol2cart(theta, dataClosed);
    
    % Filled polygon
    plotHandles(k) = fill(x, y, groupColors(k, :), ...
        'FaceAlpha', 0.25, ...
        'EdgeColor', groupColors(k, :), ...
        'LineWidth', 2, ...
        'LineStyle', lineStyles{k});
    
    % Add circles on each vertex (excluding the last repeated point)
    [xm, ym] = pol2cart(theta(1:end-1), data);
    scatter(xm, ym, markerSize^2, 'MarkerEdgeColor', 'k', ...
        'MarkerFaceColor', groupColors(k, :), 'LineWidth', 1.5);
end

% Add a neat outer circle around the radar chart
thetaCircle = linspace(0, 2*pi, 200);
[xCircle, yCircle] = pol2cart(thetaCircle, ones(size(thetaCircle)));
plot(xCircle, yCircle, 'k-', 'LineWidth', 1.5);

% Set plot limits
xlim([-1.4, 1.4]);
ylim([-1.3, 1.5]);

% Title
text(0, 1.35, 'RBCs from PDAC patients NG vs SMG', 'HorizontalAlignment', 'center', ...
     'FontSize', 18, 'FontWeight', 'bold', 'Color', [0.1 0.1 0.1]);

% Legend outside plot area
legend(plotHandles, labels, 'Location', 'southoutside', ...
       'FontSize', 14, 'Box', 'off', 'Orientation', 'horizontal');

hold off;
