function Environment

h_1 = PlaceObject('Mercedes-BenzCLK430Convertible.ply',[0,0,2]);
            verts = [get(h_1,'Vertices'), ones(size(get(h_1,'Vertices'),1),1)] * trotz(pi);
            verts(:,1) = verts(:,1) * 0.5;
            set(h_1,'Vertices',verts(:,1:3));
hold on;



surf([-1.8,-1.8;1.8,1.8] ...
,[-1.8,1.8;-1.8,1.8] ...
,[0.01,0.01;0.01,0.01] ...
,'CData',imread('Garagefloor.jpg') ...
,'FaceColor','texturemap');

hold on; 

end
