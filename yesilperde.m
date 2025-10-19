perde = im2double(imread('greenscreen.jpg'));
yol = im2double(imresize(imread('road.png'), [size(perde,1), size(perde,2)]));
mask = (perde(:,:,2) > 100/255) & (perde(:,:,2) > perde(:,:,1)*1.2) & (perde(:,:,2) > perde(:,:,3)*1.2);
result = perde .* ~cat(3,mask,mask,mask) + yol .* cat(3,mask,mask,mask);
imshow(result);
