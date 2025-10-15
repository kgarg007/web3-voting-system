// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title VotingSystem
 * @dev A simple smart contract for a voting system that rewards participants with tokens.
 * This contract is intentionally designed without a constructor or any file imports.
 * The owner must be set by calling the `initialize` function one time after deployment.
 */
contract VotingSystem {

    // --- State Variables ---

    // Mapping to store the token balance of each address.
    mapping(address => uint256) public tokenBalance;

    // Mapping to track if an address has already voted.
    mapping(address => bool) public hasVoted;

    // Total number of votes cast in the system.
    uint256 public totalVotes;

    // A constant reward amount for each vote.
    uint256 public constant VOTE_REWARD = 10;

    // The address of the contract owner.
    address public owner;

    // A private flag to ensure the initialize function is only called once.
    bool private initialized;


    // --- Events ---

    // Emitted when a user successfully votes.
    event Voted(address indexed voter, uint256 newTotalVotes);

    // Emitted when the contract is initialized.
    event Initialized(address indexed contractOwner);


    // --- Functions ---

    /**
     * @dev Initializes the contract by setting the deployer as the owner.
     * This function can only be called once and serves as a substitute for a constructor.
     */
    function initialize() public {
        require(!initialized, "Contract has already been initialized.");
        owner = msg.sender;
        initialized = true;
        emit Initialized(owner);
    }

    /**
     * @dev Allows a user to cast their vote.
     * - The contract must be initialized first.
     * - A user can only vote once.
     * - Upon voting, the user is rewarded with tokens.
     */
    function vote() public {
        require(initialized, "Contract is not initialized yet. Please call initialize().");
        require(!hasVoted[msg.sender], "Error: You have already voted.");

        // Update the state of the voter
        hasVoted[msg.sender] = true;

        // Increment the total vote count
        totalVotes++;

        // Reward the voter with tokens
        tokenBalance[msg.sender] += VOTE_REWARD;

        // Emit an event to log the vote
        emit Voted(msg.sender, totalVotes);
    }

    /**
     * @dev A view function to retrieve the token balance for a given account.
     * @param _account The address of the account to query.
     * @return The token balance of the specified account.
     */
    function getTokenBalance(address _account) public view returns (uint256) {
        return tokenBalance[_account];
    }

    /**
     * @dev A view function to check if a given address has already voted.
     * @param _voter The address to check.
     * @return A boolean value: true if the address has voted, false otherwise.
     */
    function getVoteStatus(address _voter) public view returns (bool) {
        return hasVoted[_voter];
    }
}
