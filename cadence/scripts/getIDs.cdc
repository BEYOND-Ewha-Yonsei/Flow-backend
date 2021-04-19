// flow scripts execute getIDs.cdc

import Pixori from 0x05f5f6e2056f588b

pub fun main(address: Address): [UInt64] {

    let nftOwner = getAccount(address)
    let capability = nftOwner.getCapability<&{Pixori.NFTReceiver}>(/public/NFTReceiver)
    let receiverRef = capability.borrow()
        ?? panic("Could not borrow receiver reference")

    return receiverRef.getIDs()

}
