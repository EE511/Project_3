%%--------------------------------------------------------------------------
%%Project-3:: Question - 4
%%To Simulate Accept Reject Algorithm
%%Author                Date               Revision
%%Rajasekar Raja     02/04/17         Initial Revision
%%--------------------------------------------------------------------------
function [ ] = proj_3_ques4(No_of_samples)
  %Initialize
  seq_60 =(1:60);
  p_value = harmmean(seq_60)/60;
  prob_j = p_value./seq_60; 
  prob_60 = p_value/60;
  normalization = 1/p_value;
  
  

 
Samples = rand(1,No_of_samples);
Random_variables=[]
 
for iter1 = 1:60
  count = 0;
  sum1 = 0;
  sum2=0;
  sum1=prob_j(iter1)+sum1;
  while seq_60<=No_of_samples
      if (Samples(seq_60)>=sum2)&(Samples(seq_60)<sum1)
          count=count+1;
      end 
      seq_60=seq_60+1;
  end
  Random_variables(iter1)=count;
  sum2=sum1;  
end
 figure(1)
 bar(1:60,Random_variables)   
  
  
  
  for iter=1:No_of_samples
      r_number = rand;
      iter1 = find(r_number<cumsum(prob_j));
      raja(iter) = min(iter1);
  end
  figure(1);
  histogram(raja,60);

  %To keep track of the number of count it took to hit N60
  for iter=1:1:No_of_samples
      count=0;
      while(rand >=prob_60)
          count=count+1;
      end
      tracking_matrix(iter)=count;
  end
calc_mean=mean(tracking_matrix);
calc_var=var(tracking_matrix);
theo_mean=1/(prob_60);
theo_var=(1-prob_60)/(power(prob_60,2));
disp(['Mean: Calculated = ',num2str(calc_mean),' Theoretical = ',num2str(theo_mean)]); 
disp(['Variance: Calculated = ',num2str(calc_var),' Theoretical = ',num2str(theo_var)]); 
figure(2)
histogram(tracking_matrix);
title(['Random variable calculated for ',num2str(No_of_samples),' samples']);
xlabel('Different values taken to reach the 60th value');
ylabel('Frequency of the values taken to reach 60th value');