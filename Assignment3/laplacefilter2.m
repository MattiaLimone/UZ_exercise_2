function result = laplacefilter2(f, sigma)
alpha = sigma/4;
alpha = max(0,min(alpha,1));
h1 = alpha/(alpha+1); 
h2 = (1-alpha)/(alpha+1);
h = [h1 h2 h1;h2 -4/(alpha+1) h2;h1 h2 h1];
result = filter2(h,f)/16;
end