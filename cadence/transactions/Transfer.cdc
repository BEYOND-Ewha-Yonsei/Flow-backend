// flow transactions send Transfer.cdc --signer admin-account --host access.testnet.nodes.onflow.org:9000

import Pixori from 0x05f5f6e2056f588b 

transaction(address: Address) {

    let transferToken: @Pixori.NFT
    let getMetadataRef: {String: String}

    prepare(acct: AuthAccount) {

        let collectionRef = acct.borrow<&Pixori.Collection>(from: /storage/NFTCollection)
            ?? panic("Could not borrow a reference to the owner's collection")

        self.transferToken <- collectionRef.withdraw(withdrawID: 1) // set "withdrawID" as a variable
        self.getMetadataRef = collectionRef.getMetadata(id: 1) // set "id" as a variable
    }

    execute {

        let recipient = getAccount(address) // set "0x01" as a variable(recipient address)

        let receiverRef = recipient.getCapability<&{Pixori.NFTReceiver}>(/public/NFTReceiver)
            .borrow()
            ?? panic("Could not borrow receiver reference")

        receiverRef.deposit(token: <-self.transferToken, metadata: self.getMetadataRef)
        log("NFT transferred from Admin account to Current-user account")
    }
}
 