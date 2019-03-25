function femodel = uq_10bartruss_model
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           FE model of a 10-bar truss structure            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%   Number of DOF per node
    NDOF = 2 ;

    
%   Mean variables ;
    E_mean = 1e7 ;
    A_mean = 2.5 ;
    P2 = 1e5 ;
    P4 = 1e5 ;
    
%   Nodes coordinates (x,y)    
    COORD(1,:) = [  0         0     ];
    COORD(2,:) = [  0        -360      ];
    COORD(3,:) = [  -360        0    ];
    COORD(4,:) = [  -360       -360    ];
    COORD(5,:) = [  -720       0   ];
    COORD(6,:) = [  -720       -360    ];
    
    [NbNodes , DdlPerNode] =  size(COORD);    
    
%   Elements    1
    CONEC(1,:) = [1 2];
    CONEC(2,:) = [1 3];
    CONEC(3,:) = [1 4];
    CONEC(4,:) = [2 3];
    CONEC(5,:) = [2 4];
    CONEC(6,:) = [3 4];
    CONEC(7,:) = [3 5];
    CONEC(8,:) = [3 6];
    CONEC(9,:) = [4 5];
    CONEC(10,:)= [4 6];
        
    [NbElts , NodePerElt ] =  size(CONEC);
    
%   Element type: '2' for bar elements    
    ELMAT.type = 2*ones([1 , NbElts]);  
    
%   Horizontal bars: material 'ii'    
    ELMAT.mat(1:10) = 1:10;
        
%   Elements 'ii' properties
    for ii = 1:10
        MATS{ii}.Emean = E_mean;
        MATS{ii}.Amean = A_mean;
    end
    
%   Boundary conditions: free=0 & blocked=1    
    BC = zeros ([NbNodes , DdlPerNode]);  % default value is free
    BC(5,:) = [1 1] ;
    BC(6,:) = [1 1] ;
    
%   Loading 
    LOADS = zeros([NbNodes , DdlPerNode]);
    LOADS(2,2) = -P2 ;
    LOADS(4,2) = -P4 ;
        
    TypeDef = 0 ;
    
%   Gathering the data in a structure called 'femodel'    
    femodel = MakeModel_gPC(TypeDef,COORD,CONEC,BC,MATS, ELMAT, LOADS, NDOF) ;
    
%   Compute the displacement field    
    U = myfem(femodel);
%     
% %   Display the deformed structure    
%     plot_output(1,COORD, CONEC,U,0)

