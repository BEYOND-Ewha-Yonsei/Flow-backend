// flow scripts execute GetMetadata.cdc

import Pixori from 0x02

pub fun main() {

    let nftOwner = getAccount(0x01)
    let capability = nftOwner.getCapability<&{ExampleNFT.NFTReceiver}>(/public/NFTReceiver)
    let receiverRef = capability.borrow()
        ?? panic("Could not borrow the receiver reference")

    log("Account 2 NFTs")
    log(receiverRef.getMetadata(id: 1)) // set "id" as a variable
}
