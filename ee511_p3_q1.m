%%--------------------------------------------------------------------------
%%Project-3:: Question - 1
%%To simulate the lot sampling to estimate the probability that the distributor 
%%will reject the lot if it tests five microchips. And finds the fewest number of 
%%microchips that the distributor should test to reject this lot 95% of the time

%%The below function first 
%%Author                Date               Revision
%%Rajasekar Raja     02/04/17         Initial Revision
%%--------------------------------------------------------------------------
function [ ] = prob_reject_lot(sample_lot)
  %Initialize
  reject = 0;
  N_microchips = 125;
  defective = [1 2 3 4 5 6];
  prob_rejection =0.95;
  max_limit = 1000;
  
  %Probability that the distributor will reject the lot if it tests 5 microchips.
  for iter=1:sample_lot 
      sample = randsample(N_microchips,5);
      check_def = ismember(sample,defective);
      if(sum(check_def) >0)
          reject = reject +1;
      end
  end
  disp(['Among ',num2str(sample_lot),' sample lot, ',num2str(reject),' samples got rejected']);
  disp(reject);
  disp(['Probability that the distributor will reject the lot if it tests 5 microchips ', num2str(reject/sample_lot)]);
  
  %Fewest number of microchips that the distributor should test to reject a lot 95% of the time
  count_out=1;
  flag_out =1;
  while (flag_out == 1)
      count_out = count_out+1;
      reject = 0;
      count_in = 0;
      flag_in = 1;
      while(flag_in == 1)
          count_in = count_in+1;
          sample = randsample(N_microchips,count_out);
          check_def = ismember(sample,defective);
          if(sum(check_def) >0)
              reject = reject +1;
          end
          if (reject == prob_rejection * count_in)
              disp(['Total runs of experiment ',num2str(count_in),' of which ',num2str(reject),' lots are rejected ']);
              disp(['Fewest number of microchips to test for rejection of lot 95% of the time is ',num2str(count_out)]);  
              flag_in = 0;                      
              flag_out = 0;                
          end
          if count_in == max_limit
              flag_in = 0;              
          end
      end
  end