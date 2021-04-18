// flow transactions send Mint.cdc --signer admin-account --host access.testnet.nodes.onflow.org:9000

import Pixori from 0x05f5f6e2056f588b 

transaction(metadata: {String: String}) {

    let receiverRef: &{Pixori.NFTReceiver}
    let minterRef: &Pixori.NFTMinter

    prepare(acct: AuthAccount) {

        self.receiverRef = acct.getCapability<&{Pixori.NFTReceiver}>(/public/NFTReceiver)
            .borrow()
            ?? panic("Could not borrow receiver reference")
        
        self.minterRef = acct.borrow<&Pixori.NFTMinter>(from: /storage/NFTMinter)
            ?? panic("Could not borrow minter reference")

        // log minted ID
        log(self.minterRef.idCount) 
    }

    execute {

        let newNFT <- self.minterRef.mintNFT()

        }
        self.receiverRef.deposit(token: <-newNFT, metadata: metadata)
        log("NFT Minted and deposited to the Current user's Collection")
    }
}
