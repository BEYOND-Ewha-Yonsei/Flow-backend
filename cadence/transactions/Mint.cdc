// flow transactions send --code Mint.cdc --signer admin-account

import Pixori from 0x05f5f6e2056f588b 

transaction {

    let receiverRef: &{ExampleNFT.NFTReceiver}
    let minterRef: &ExampleNFT.NFTMinter

    prepare(acct: AuthAccount) {

        self.receiverRef = acct.getCapability<&{ExampleNFT.NFTReceiver}>(/public/NFTReceiver)
            .borrow()
            ?? panic("Could not borrow receiver reference")
        
        self.minterRef = acct.borrow<&ExampleNFT.NFTMinter>(from: /storage/NFTMinter)
            ?? panic("could not borrow minter reference")
    }

    execute {

        let newNFT <- self.minterRef.mintNFT()

        // set "metadata" as a variable
        let metadata: {String: String} = {
            "name": "example3",
            "time": "11:33 PM",
            "location": "home"
        }
        self.receiverRef.deposit(token: <-newNFT, metadata: metadata)

        log("NFT Minted and deposited to Account 2's Collection")
    }
}
