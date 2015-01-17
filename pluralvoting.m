% effect of plural voting
% 2015
% Awbrey Hughlett

% setup block of voters
voters = rand(100, 100);

% run plurality vote first
% random numbers denote voting preference
% extremes dictate where on the spectrum people will vote
% 0 - conservative
% 1 - liberal
% ccccclllll

liberal = 0;
conservative = 0;

for i = 1:columns(voters)
  for j = 1:rows(voters)
    temp = round(voters(i, j));
    if(temp == 0)
      conservative = conservative + 1;
    else 
      liberal = liberal + 1;
    endif
  endfor
endfor

disp("Under a typical plurality voting system, assuming a 50/50 split in voting preference, a vote should yield a result similar to this:")
disp("---------------------")
disp("liberal votes: "), disp(sprintf("%5.2f", liberal))
disp(" ")
disp("conservative votes: "), disp(sprintf("%5.2f", conservative))
disp(" ")


disp("[-------------------------------]")


% run plural vote next
% same random voters
% middle ground randomly votes for second candidate
% c - conservative
% m - moderate
% l - liberal
% ccmmmmmmll

liberal_p = 0;
moderate_p = 0;
conservative_p = 0;
plural_vote_chance = 0.75;
extreme_magnitude = 0.2;
moderate_for_third = 0.05;

for i = 1:columns(voters)
  for j = 1:rows(voters)
    temp = voters(i, j);
    % if top or bottom 20 percent, cast single vote
    if(temp > 1*(1-extreme_magnitude) || temp < 1*extreme_magnitude)
      temp = round(temp);
      if(temp == 0)
        conservative_p = conservative_p + 1;
      else 
        liberal_p = liberal_p + 1;
      endif
    else
      % temp = round(temp);
      % give 50 percent chance that a moderate voter will cast a plural vote
      if(rand(1) < plural_vote_chance)
        moderate_p = moderate_p + 1;
      endif
      if(temp >= 0 && temp <= 1*(0.5-moderate_for_third))
        conservative_p = conservative_p + 1;
      elseif(temp <= 1 && temp >= 1*(0.5+moderate_for_third))
        liberal_p = liberal_p + 1;
      else
        
      endif
    endif
  endfor
endfor

disp(" ")
disp("If any voter were allowed to vote for multiple candidates, the voting becomes a bit more complicated. Assuming that some voters within a certain range of")
disp("extremes would only vote for a single candidate, median voters would have a certain statistic for chosing a supplemental candidate within their spectrum.")
disp("This system has a chance of reducing the impact of voters choosing the candidate most likely to win in favor of voting for the candidate they actually desire.")
disp("---------------------")
disp("liberal votes: "), disp(sprintf("%5.2f", liberal_p))
disp(" ")
disp("conservative votes: "), disp(sprintf("%5.2f", conservative_p))
disp(" ")
disp("moderate votes: "), disp(sprintf("%5.2f", moderate_p))