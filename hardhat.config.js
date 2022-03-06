/**
 * @type import('hardhat/config').HardhatUserConfig
 */
require("@nomiclabs/hardhat-waffle")
require("@nomiclabs/hardhat-web3");
const dotenv = require('dotenv');
dotenv.config();


const alchemy_key = process.env.ALCHEMY_API_KEY;
const private_key = process.env.PRIVATE_KEY;

//dotenvConfig({ path: resolve(__dirname, "./.env") });

task("accounts", "Prints accounts", async (_, { web3 }) => {
  console.log(await web3.eth.getAccounts());
});

module.exports = {
  solidity: "0.8.4",
  defaultNetwork: "hardhat",
  networks: {
    hardhat: {
      forking: {
        url: `https://eth-mainnet.alchemyapi.io/v2/${alchemy_key}`,
        blockNumber: 14315187,
        gasPrice: 00000000000,
      }
    }
  }
};
