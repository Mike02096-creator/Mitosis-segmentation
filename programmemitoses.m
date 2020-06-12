clear all
close all

%rep = 'C:\Users\Michael\Desktop\Vision par ordinateur';
%ext = '*.jpg';

%chemin = fullfile(rep,ext);

%list = dir(chemin);

%for n = 1:numel(list)
 %   I = imread(fullfile(rep, list(n).name), ext(3:end));
  %  imshow(I)


I = imread('hi.jpg');
imshow(I);
%imfinfo('hi.jpg');

%Conversion de l'image en niveau de gris
G = I;
G(:,:,1) = 0;
G(:,:,3) = 0;

%image(G);
%axis image;
%title('Composante G');
J=rgb2gray(G);
%figure;
%imshow(J);
%axis image;
%title('Conversion de l''image en niveaux de gris');

%Binarisation par un seuil optimal

BW = imbinarize(J)
%figure
%imshow(BW);
%title('Image binarisée par un seuil optimal');

%Ouverture morphologique

se = strel('disk',20)
background = imopen(BW,se);
figure;
imshow(background,[]);
title('Ouverture morphologique de l''image binarisée');


%Detection des objects de l'image

d = imdistline;
delete(d)
figure;
b=bwboundaries(background);
imshow(background);
title('Detection des objets de l''image')
hold on
for i=1:length(b)
    contour=b{i};
    plot(contour(:,2),contour(:,1),'g','LineWidth',3);
end

%Extraction des paramètres des objets

s = regionprops('table',background,J, 'MajorAxisLength','MinorAxisLength', 'Eccentricity','Area','MeanIntensity','Centroid')
f = regionprops('table',background,J,'Centroid')
g = regionprops(background,J,'MeanIntensity')
k = [g.MeanIntensity];
j = [s.Eccentricity];
m = [s.MinorAxisLength];

for nbr=1:length(b(1:56))
    if k(nbr) > 58 && j(nbr)> 0.68 && m(nbr)<60
            p = cat(1,f.Centroid);
            x = p(nbr,1);
            y = p(nbr,2);
            r=[x y]
            scatter(x,y)
            
    end
end
%end

h = imread('hi.bmp');
figure
imshow(h);
%imfinfo('hi.bmp');

%for d=1:28
  % h = sprintf('hi%d.bmp',d);
 %  im=imshow(h);
%end

%Conversion de l'image en niveau de gris
B = h;
B(:,:,1) = 0;
B(:,:,2) = 0;

%imshow(B);
%axis image;
%title('Composante B');
U=rgb2gray(B);
%figure;
%imshow(U);
%axis image;
%title('Conversion de l''image en niveaux de gris');

%Binarisation par un seuil optimal

BW2 = imbinarize(U)
%figure
%imshow(BW2);
%title('Image binarisée par un seuil optimal');

%Detection des objects de l'image

d1 = imdistline;
delete(d1)
figure
n=bwboundaries(BW2);
imshow(BW2)
title('Detection des objets de l''image')
hold on
for i=1:length(n)
    contour=n{i};
    plot(contour(:,2),contour(:,1),'g','LineWidth',3);
end

v = regionprops('table',BW2,U, 'MajorAxisLength','MinorAxisLength', 'Eccentricity','Area','MeanIntensity','Centroid')

%F1 Score


%TP=0
%FP=0
%FN=0

%for i1=1:length(r(1:3))
 %   if v.Centroid==r(i1)
        
        
