// flow transactions send --code Transfer.cdc --signer admin-account

import ExampleNFT from 0x02 // set "0x02" as admin-account address

transaction {

    let transferToken: @ExampleNFT.NFT
    let getMetadataRef: {String: String}

    prepare(acct: AuthAccount) {

        let collectionRef = acct.borrow<&ExampleNFT.Collection>(from: /storage/NFTCollection)
            ?? panic("Could not borrow a reference to the owner's collection")

        self.transferToken <- collectionRef.withdraw(withdrawID: 1) // set "withdrawID" as a variable
        self.getMetadataRef = collectionRef.getMetadata(id: 1) // set "id" as a variable
    }

    execute {

        let recipient = getAccount(0x01) // set "0x01" as a variable(recipient address)

        let receiverRef = recipient.getCapability<&{ExampleNFT.NFTReceiver}>(/public/NFTReceiver)
            .borrow()
            ?? panic("Could not borrow receiver reference")

        receiverRef.deposit(token: <-self.transferToken, metadata: self.getMetadataRef)
        log("NFT ID 1 transferred from account 2 to account 1")
    }
}
 