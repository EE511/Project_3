%%--------------------------------------------------------------------------
%%Project-3:: Question - 2
%%To Simulate one hour of arrivals to the freeway onramp by Bernoulli & Poisson method

%%The below function first calculates car arrivals for bernoulli method 
%%followed by Inverse Transform method and theoritical method. It finally
%%compares all the three
%%Author                Date               Revision
%%Rajasekar Raja     02/04/17         Initial Revision
%%--------------------------------------------------------------------------
function [ ] = proj3_ques2(sub_intervals)
  %Initialize
  lambda = 120;  
  Y = 1:1000;
  %Bernoulli Method
  for iter1=1:1000      
      p_value = lambda/sub_intervals;
      r_number = rand(sub_intervals,1);
      Bernoulli_trails = r_number < p_value;
      vec_bernoulli(iter1) = sum(Bernoulli_trails);
  end
  hist(vec_bernoulli);
  
  %Inverse Transform Method
  for iter2 = 1:1000
      % computes the Poisson pdf at each of the values in X using mean parameters in lambda.
      p_value = poisspdf(0,lambda);
      f_value = p_value; %p0 value
      index = 0;
      r_number2 = rand();
      while(r_number2 > f_value) %p0+p1+... until r_number2<summation
          p_value = poisspdf(index+1,lambda);
          f_value = f_value+p_value;
          index = index+1;        
      end
      vec_inv_tranfm(iter2) = index;
  end
  
  %Theoritical Value
  for iter3=1:1000
      vec_theo(iter3) = poisspdf(iter3,lambda);
  end
  
  figure(1)
  histogram(vec_bernoulli);
  title('Bernoulli Trail Histogram: Car arrivals per hour(5000 intervals)');
  xlabel('Number of car arrivals in one hour');
  ylabel('Frequency of car arrivals in one hour');  

  figure(2);
  title('Bernoulli Trail overlayed on Theoritical PMF');
  yyaxis left;
  histogram(vec_bernoulli);
  yyaxis right;
  plot(Y,vec_theo,'m--*');
  
  figure(3)
  title('Inverse Transform Method Overlayed on Theoritical PMF');
  yyaxis left;
  histogram(vec_inv_tranfm);
  yyaxis right;
  plot(Y,vec_theo,'m--*');
  
  figure(4)
  stem(Y, vec_theo);