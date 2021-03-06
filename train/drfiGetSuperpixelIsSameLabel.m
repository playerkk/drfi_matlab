function same_lab = drfiGetSuperpixelIsSameLabel( gtmask, imdata )
    % gtmask    ground truth of the PIXEL_WISE annotation
    % imdata    generated by the getImData
    
    adjlist = imdata.adjlist;
    
    nadj = size(adjlist, 1);
    spstats = imdata.spstats;
    
    gtmask = double(gtmask);
    
    same_lab = zeros(nadj, 1);
    
    for k = 1:nadj
        s1 = adjlist(k, 1);
        s2 = adjlist(k, 2);
        
        same_lab(k) = (mode(gtmask(spstats(s1).PixelIdxList))...
            == mode(gtmask(spstats(s2).PixelIdxList)) );
    end
    
    same_lab(same_lab == 0) = -1;
end