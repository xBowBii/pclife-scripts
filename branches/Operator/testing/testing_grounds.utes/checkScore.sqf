_reward = _this select 0;
hint "Kill triggered!";
score = score + _reward;
player globalchat format ["Score is: %1",score];
publicVariable "score";