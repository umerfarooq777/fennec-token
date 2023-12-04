// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// Company: Decrypted Labs
/// @title FennecToken  
/// @author Rabeeb Aqdas
/// @notice An ERC20 token contract for the Fennec ecosystem.
/// @dev Inherits ERC20 standard token functionality from OpenZeppelin and ownership functionality.
contract Fennec is ERC20, Ownable {

    // Tokenomics constants
    uint256 public constant TOTAL_SUPPLY = 300_000_000 * 10**18; // 300 million tokens 
    uint256 public constant GAMING = (TOTAL_SUPPLY * 40) / 100;
    uint256 public constant ECOSYSTEM_DEVELOPMENT_PARTNERSHIPS = (TOTAL_SUPPLY * 15) / 100;
    uint256 public constant PARTNERSHIPS_COLLABORATIONS = (TOTAL_SUPPLY * 10) / 100;
    uint256 public constant TEAM_ADVISORS = (TOTAL_SUPPLY * 10) / 100;
    uint256 public constant MARKETING_COMMUNITY = (TOTAL_SUPPLY * 10) / 100;
    uint256 public constant LIQUIDITY_PROVISION = (TOTAL_SUPPLY * 5) / 100;
    uint256 public constant STRATEGIC_RESERVE = (TOTAL_SUPPLY * 5) / 100;
    uint256 public constant STAKING_REWARDS = (TOTAL_SUPPLY * 3) / 100;
    uint256 public constant PUBLIC_SALE = (TOTAL_SUPPLY * 2) / 100;

    // Destination addresses for token allocation
    address private immutable gaming;
    address private immutable ecosystem_development_partnerships;
    address private immutable partnerships_collaborations;
    address private immutable team_advisors;
    address private immutable marketing_community;
    address private immutable liquidity_provision;
    address private immutable strategic_reserve;
    address private immutable staking_rewards;
    address private immutable publicsale;

    // State variable to ensure initialization happens only once
    bool private _initialized;

    /// @notice Constructor to create FennecToken
    /// @dev Sets up the token name, symbol, and initial distribution addresses.
    /// @param _gaming Address for gaming allocation
    /// @param _ecosystem_development_partnerships Address for ecosystem development and partnerships
    /// @param _partnerships_collaborations Address for partnerships and collaborations
    /// @param _team_advisors Address for team and advisors
    /// @param _marketing_community Address for marketing and community
    /// @param _liquidity_provision Address for liquidity provision
    /// @param _strategic_reserve Address for strategic reserve
    /// @param _staking_rewards Address for staking rewards
    /// @param _publicsale Address for public sale
    constructor(
        address _gaming,
        address _ecosystem_development_partnerships,
        address _partnerships_collaborations,
        address _team_advisors,
        address _marketing_community,
        address _liquidity_provision,
        address _strategic_reserve,
        address _staking_rewards,
        address _publicsale
        ) ERC20("Ferren Token", "FTK") Ownable(_msgSender()) {
       gaming = _gaming;
       ecosystem_development_partnerships = _ecosystem_development_partnerships;
       partnerships_collaborations = _partnerships_collaborations; 
       team_advisors = _team_advisors; 
       marketing_community = _marketing_community;
       liquidity_provision = _liquidity_provision; 
       strategic_reserve = _strategic_reserve; 
       staking_rewards = _staking_rewards; 
       publicsale = _publicsale; 
    }

    /// @notice Initialize token distribution to the predefined addresses.
    /// @dev Mints tokens to the respective addresses based on the allocation percentages.
    /// Can only be called once by the contract owner.
    /// @custom:modifier onlyOwner Restricts the function access to the contract owner.
    function initialize() external onlyOwner {
        require(!_initialized,"Already Initialized");
        _mint(gaming,GAMING);
        _mint(ecosystem_development_partnerships,ECOSYSTEM_DEVELOPMENT_PARTNERSHIPS);
        _mint(partnerships_collaborations,PARTNERSHIPS_COLLABORATIONS);
        _mint(team_advisors,TEAM_ADVISORS);
        _mint(marketing_community,MARKETING_COMMUNITY);
        _mint(liquidity_provision,LIQUIDITY_PROVISION);
        _mint(strategic_reserve,STRATEGIC_RESERVE);
        _mint(staking_rewards,STAKING_REWARDS);
        _mint(publicsale,PUBLIC_SALE);
        _initialized = true;
    }

}