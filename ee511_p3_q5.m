%%--------------------------------------------------------------------------
%%Project-3:: Question - 5
%%To Simulate Accept Reject Algorithm
%%Author                Date               Revision
%%Rajasekar Raja     02/04/17         Initial Revision
%%--------------------------------------------------------------------------
function [ ] = accept_reject(sub_intervals)
  p_value = [6 6 6 6 6 15 13 14 15 13 0 0 0 0 0 0 0 0 0 0]/100; 
  No_of_samples = 100000;
  seq_nums = 1:length(p_value);
  c=0.15/0.05;%Max of p/q 
  for iter = 1:No_of_samples
      count = 0;
      while 1, 
          count = count + 1;
          uniform_j = 1 + floor(20*rand); % Get Uniform j
          if ((c*rand) < p_value(uniform_j)/0.05) % Accept p(j) if U<p(j)/c, q(j)= 0.1
              accept(iter) = uniform_j;
              theo_constant_C(iter) = count;
              break;
          end;
      end;
  end;
  yyaxis left;
  plot(p_value,'m--o');
  yyaxis right;
  counts = histc(accept,seq_nums);
  %Normalizing the graph from 100,000 samples to 20 count
  bar(seq_nums,counts/sum(counts));
 
  %Calculated Mean and Theoritical Mean
  theo_mean = sum(p_value.*[1:20]);
  calc_mean = mean(accept);
  disp(['Sample Mean: Calculated = ',num2str(calc_mean),' Theoretical = ',num2str(theo_mean)]); 
  
  %Calculated Var and Theoritical Var
  theo_var =sum( p_value.*([1:20]-theo_mean).^2);
  calc_var=var(accept);
  disp(['Sample Variance: Calculated = ',num2str(calc_var),' Theoretical = ',num2str(theo_var)]); 
   
  theo_efficiency = 100/mean(theo_constant_C);
  calc_efficiency = 100*100000/(sum(theo_constant_C));
  disp(['Efficiency: Calculated = ',num2str(calc_efficiency),' Theoretical = ',num2str(theo_efficiency)]); 