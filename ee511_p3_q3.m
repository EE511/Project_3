%%--------------------------------------------------------------------------
%%Project-3:: Question - 3
%%To simulate the smallest number of uniform random samples whose sum is greater than four

%%Author                Date               Revision
%%Rajasekar Raja     02/04/17         Initial Revision
%%--------------------------------------------------------------------------
function [ ] = proj3_ques3(no_of_runs)
  %Initialize
  index=1;
  for iter = 1:no_of_runs
      count = 0;
      sum_of_Rand_samples = 0;
      r_number = rand(1000,1); 
      while(sum_of_Rand_samples<=4)          
          count = count + 1;
          sum_of_Rand_samples = sum_of_Rand_samples + r_number(count);
      end      
      no_of_samples(index) = count;
      r(iter) = sum_of_Rand_samples
      index = index+1;
  end
  mean(r)
  disp(['E[N] of ',num2str(no_of_runs),' samples of N is',num2str(mean(no_of_samples))]);
  histogram(no_of_samples);
  xlabel('min numbers exceeding sum-4');
  ylabel('freq of occurence of numbers exceeding sum 4');  
  title(['histogram of rand variables for ',num2str(no_of_runs),' samples']);  
end