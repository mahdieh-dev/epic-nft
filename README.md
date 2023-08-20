# Epic NFT contract

Epic NFT is a website that connects to its smart contract and lets you create epic NFTs on the Ethereum blockchain.

This repository only contains the smart contract and it is deployed on the Goerli testnet.

The contract will create 3 different SVG shapes with various random colors.

Every address will have the chance to mint their own NFTs but it will have a maximum amount that will be specified by the web3 app that calls the `makeAnEpicNFT` function.

A cooldown timer of 1 minute is set after each minting process.


## Built With

- Hardhat
- Ethers
- Ethereum-waffle

## Live Demo

Click [here](mahdieh-nft-project.mshavandi.repl.co/) to see the live demo.

## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

- git: This is a version control system used for source code management.
- A text editor (e.g Visual Studio Code (recommended), Sublime Text, Atom etc.)
- Browser Engine on your terminal preferably NodeJs
- Knowledge of solidity, blockchain and smart contracts

### Setup

- With git, clone the code to your machine, or download a ZIP of all the files directly.
- [Download the ZIP file from this location](https://github.com/mahdieh-dev/epic-nft/archive/refs/heads/main.zip) or run the following [git](https://git-scm.com/) command to clone the files to your machine:

```
git clone https://github.com/mahdieh-dev/epic-nft.git
```

- Once the files are on your machine, open the **epic-nft** folder in [Visual Studio Code](https://code.visualstudio.com/download).
- Create the following two files in the root directory:

  - `hardhat.config.js`: For specifying the hardhat config
  - `.env`: For specifying the environmental variables needed

## Install

- Open the **VS Code** integrated terminal and run the following commands:

```
npm install
```

This will install all the packages and dependencies used in the project.

## Usage

- Run the following commands:

```shell
# to get test accounts
npx hardhat accounts

# to run and test locally:
npx hardhat run scripts/run.js

# to deploy on the blockchain
npx hardhat run scripts/deploy.js
```

## Authors

👩🏻‍💼 **Mahdieh Shavandi**

- GitHub: [@mahdieh-dev](https://github.com/mahdieh-dev)
- StackOverFlow: [@mahdieh-shavandi](https://stackoverflow.com/users/8898138/mahdieh-shavandi)
- LinkedIn: [Mahdieh Shavandi](https://www.linkedin.com/in/mshvnd/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!
Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!
