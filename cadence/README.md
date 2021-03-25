## How to execute on [Playground](https://play.onflow.org/b60aa97d-d030-476e-9490-24f3a6f90161)

1. Deploy ./contracts/NFT.cdc at "0x02" tab
2. Deploy ./transactions/Mint.cdc at "Mint NFT" tab
3. Deploy ./transactions/Setup.cdc at "Setup Account" tab
4. Deploy ./transactions/Transfer.cdc at "Transfer" tab
5. Deploy ./scripts/getMetadata.cdc at "Print 0x02 NFTs" tab



## Transaction Results

```
// Deploy Transfer.cdc twice

> unexpectedly found nil while forcing an Optional value

// However, NFT(id: 1) still exists in 0x02's NFTCollection
```



## Script Results

```
// Print 0x02 NFTs 

> "Account 2 NFTs"
> {"name": "example3", "time": "11:33 PM", "location": "home"}
```



## Storage Results

- 0x01

```
// NFTCollection

{
  "type": "Resource",
  "value": {
    "id": "A.0000000000000002.ExampleNFT.Collection",
    "fields": [
      {
        "name": "uuid",
        "value": {
          "type": "UInt64",
          "value": "4"
        }
      },
      {
        "name": "ownedNFTs",
        "value": {
          "type": "Dictionary",
          "value": [
            {
              "key": {
                "type": "UInt64",
                "value": "1"
              },
              "value": {
                "type": "Resource",
                "value": {
                  "id": "A.0000000000000002.ExampleNFT.NFT",
                  "fields": [
                    {
                      "name": "uuid",
                      "value": {
                        "type": "UInt64",
                        "value": "2"
                      }
                    },
                    {
                      "name": "id",
                      "value": {
                        "type": "UInt64",
                        "value": "1"
                      }
                    },
                    {
                      "name": "metadata",
                      "value": {
                        "type": "Dictionary",
                        "value": []
                      }
                    }
                  ]
                }
              }
            }
          ]
        }
      },
      {
        "name": "metadataObjs",
        "value": {
          "type": "Dictionary",
          "value": [
            {
              "key": {
                "type": "UInt64",
                "value": "1"
              },
              "value": {
                "type": "Dictionary",
                "value": [
                  {
                    "key": {
                      "type": "String",
                      "value": "name"
                    },
                    "value": {
                      "type": "String",
                      "value": "example3"
                    }
                  },
                  {
                    "key": {
                      "type": "String",
                      "value": "time"
                    },
                    "value": {
                      "type": "String",
                      "value": "11:33 PM"
                    }
                  },
                  {
                    "key": {
                      "type": "String",
                      "value": "location"
                    },
                    "value": {
                      "type": "String",
                      "value": "home"
                    }
                  }
                ]
              }
            }
          ]
        }
      }
    ]
  }
}
```



- 0x02

```
// NFTCollection

{
  "type": "Resource",
  "value": {
    "id": "A.0000000000000002.ExampleNFT.Collection",
    "fields": [
      {
        "name": "uuid",
        "value": {
          "type": "UInt64",
          "value": "0"
        }
      },
      {
        "name": "ownedNFTs",
        "value": {
          "type": "Dictionary",
          "value": []
        }
      },
      {
        "name": "metadataObjs",
        "value": {
          "type": "Dictionary",
          "value": [
            {
              "key": {
                "type": "UInt64",
                "value": "1"
              },
              "value": {
                "type": "Dictionary",
                "value": [
                  {
                    "key": {
                      "type": "String",
                      "value": "name"
                    },
                    "value": {
                      "type": "String",
                      "value": "example3"
                    }
                  },
                  {
                    "key": {
                      "type": "String",
                      "value": "time"
                    },
                    "value": {
                      "type": "String",
                      "value": "11:33 PM"
                    }
                  },
                  {
                    "key": {
                      "type": "String",
                      "value": "location"
                    },
                    "value": {
                      "type": "String",
                      "value": "home"
                    }
                  }
                ]
              }
            }
          ]
        }
      }
    ]
  }
}
```

```
// NFTMinter

{
  "type": "Resource",
  "value": {
    "id": "A.0000000000000002.ExampleNFT.NFTMinter",
    "fields": [
      {
        "name": "uuid",
        "value": {
          "type": "UInt64",
          "value": "1"
        }
      },
      {
        "name": "idCount",
        "value": {
          "type": "UInt64",
          "value": "2"
        }
      }
    ]
  }
}
```





