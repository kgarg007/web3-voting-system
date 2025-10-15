🗳️ VotingSystem Smart Contract
This repository contains the Solidity smart contract for a simple, token-rewarded voting system designed for internal use within a decentralized application or community. The core function allows users to cast a single, immutable vote. To incentivize participation and record commitment, every voter is immediately rewarded with a set number of internal, non-transferable tokens.

This contract is intentionally designed to be lightweight, focusing exclusively on essential voting and reward logic. It avoids relying on external token standards (like ERC-20) or complex governance structures, making it an ideal starting point for a simple participation-tracking mechanism.

🌟 Features
One-Time Vote: Each unique address can cast a vote only once, ensuring the integrity of the vote count.

Token Reward: Every successful voter is instantly credited with 10 tokens (defined by the VOTE_REWARD constant) to their internal balance. These tokens serve as a participation score or internal currency within the system.

Owner-Controlled Setup: The contract utilizes an explicit initialize() function instead of a constructor. This design provides flexibility in complex deployment scenarios (e.g., proxy patterns) by delaying the assignment of the owner until the function is called, which must happen only once immediately after deployment.

Public State: Key metrics such as the totalVotes cast, individual tokenBalance records, and an address's getVoteStatus are all publicly accessible via view functions, promoting transparency.

🛠️ Contract Details
Detail

Value

Solidity Version

^0.8.20

Contract Name

VotingSystem

License

MIT

Reward Per Vote

10

Key Functions
Function

Type

Description

initialize()

public

MUST be called once immediately after deployment to set the contract owner.

vote()

public

Allows msg.sender to cast a vote and receive the token reward. Fails if the sender has already voted.

getTokenBalance(address _account)

view

Returns the token balance for any given address.

getVoteStatus(address _voter)

view

Checks if a given address has already cast a vote (true or false).

totalVotes

public view

The total number of votes cast across all users.

owner

public view

The address that initialized the contract.

🚀 Deployment Instructions
Compile: Compile the voting_system.sol file using a Solidity compiler (version 0.8.20 or higher).

Deploy: Deploy the compiled bytecode to your desired EVM-compatible network.

Initialize: Crucially, immediately call the initialize() function. The address that calls this function will be set as the owner.

📞 Contact & Support
For questions regarding the contract logic, potential integrations, or bug reports, please contact the developer via this Ethereum address.

Developer Contact Address: 0x03D082B44C0A397C1B9f8ab24fe8cd2A8B8350f8
