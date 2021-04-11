// flow transactions send --code Setup.cdc --signer user-account

import Pixori from 0x05f5f6e2056f588b 

transaction {

    prepare(acct: AuthAccount) {

        let collection <- ExampleNFT.createEmptyCollection()

        acct.save<@ExampleNFT.Collection>(<-collection, to: /storage/NFTCollection)
        log("Collection created for account 1")

        acct.link<&{ExampleNFT.NFTReceiver}>(/public/NFTReceiver, target: /storage/NFTCollection)
        log("Capability created")
    }
}
 