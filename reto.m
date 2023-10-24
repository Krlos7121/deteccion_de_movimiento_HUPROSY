fig1 = imread("TestImage1.jpg");
fig1_gray = rgb2gray(fig1);
%figure
%imshow(fig1_gray);

% imtool(fig1_gray);

fig2 = imread("TestImage2.jpg");
fig2_gray = rgb2gray(fig2);
%figure
%imshow(fig2_gray);

% imtool(fig2_gray); 

compare = abs(fig1_gray - fig2_gray);
%figure
%imshow(compare);

maxDif = max(max(compare)); 

[maxRow, maxCol] = find(compare == maxDif);
%imshow(compare);
%hold on
%plot(maxCol, maxRow, 'r*');

% threshold de dif de compare
umbral = compare > 30;
%imshow(umbral);

% quitar huecos
figRellena = bwareaopen(umbral, 10);
%figure
%imshow(figRellena);

resaltado = imoverlay(fig2, figRellena, [1 0 0]);
figure
imshow(resaltado);

% determinar longitud de diferencias
figLen = regionprops(figRellena, 'MajorAxisLength');