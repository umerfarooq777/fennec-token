
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts@5.0.0/token/ERC20/ERC20.sol";

contract FerrenToken is ERC20 {
    constructor(
        uint256 _total_token_supply,
        address _gaming, //40%
        address _ecosystem_development_partnerships, //15%
        address _partnerships_collaborations, //10%
        address _team_advisors, //10%
        address _marketing_community,//10%
        address _liquidity_provision, //5%
        address _strategic_reserve, //5%
        address _staking_rewards, //3%
        address _publicsale //2%
        ) ERC20("Ferren Token", "FTK") {
            uint256 _supply = _total_token_supply * 10 ** decimals();
        _mint(_gaming, getPercentageAmount(40,_supply) );
        _mint(_ecosystem_development_partnerships, getPercentageAmount(15,_supply) );
        _mint(_partnerships_collaborations, getPercentageAmount(10,_supply) );
        _mint(_team_advisors, getPercentageAmount(10,_supply) );
        _mint(_marketing_community, getPercentageAmount(10,_supply) );
        _mint(_liquidity_provision, getPercentageAmount(5,_supply) );
        _mint(_staking_rewards, getPercentageAmount(5,_supply) );
        _mint(_strategic_reserve, getPercentageAmount(3,_supply) );
        _mint(_publicsale, getPercentageAmount(2,_supply) );
    }
uint8 shares = 100;

    function getPercentageAmount(uint8 _percentage,uint256 _totalSupply) pure public returns (uint256){
        require(_percentage>0&&_percentage<101);
        require(_totalSupply>0);
        return (_totalSupply*_percentage)/100;
    }
}
