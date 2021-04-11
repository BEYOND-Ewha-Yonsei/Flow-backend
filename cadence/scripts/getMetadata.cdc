// flow scripts execute GetMetadata.cdc

import Pixori from 0x05f5f6e2056f588b

pub fun main() {

    let nftOwner = getAccount(0x01)
    let capability = nftOwner.getCapability<&{Pixori.NFTReceiver}>(/public/NFTReceiver)
    let receiverRef = capability.borrow()
        ?? panic("Could not borrow receiver reference")

    log("Current user's NFTs")
    log(receiverRef.getMetadata(id: 1)) // set "id" as a variable
}
