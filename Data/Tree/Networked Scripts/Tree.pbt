Name: "Networked Scripts"
RootId: 7193685109751679562
Objects {
  Id: 4569329967828069285
  Name: "PIXELDEPTH_Weapon_Assets"
  Transform {
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 7193685109751679562
  UnregisteredParameters {
    Overrides {
      Name: "cs:1"
      AssetReference {
        Id: 16736334133108468873
      }
    }
    Overrides {
      Name: "cs:2"
      AssetReference {
        Id: 5139577233495702296
      }
    }
    Overrides {
      Name: "cs:3"
      AssetReference {
        Id: 11046267487575133707
      }
    }
    Overrides {
      Name: "cs:4"
      AssetReference {
        Id: 13889620140070819405
      }
    }
    Overrides {
      Name: "cs:5"
      AssetReference {
        Id: 15027938538745799724
      }
    }
    Overrides {
      Name: "cs:6"
      AssetReference {
        Id: 15219259482893644150
      }
    }
    Overrides {
      Name: "cs:7"
      AssetReference {
        Id: 17822303196875392730
      }
    }
    Overrides {
      Name: "cs:8"
      AssetReference {
        Id: 15429816518147664532
      }
    }
    Overrides {
      Name: "cs:9"
      AssetReference {
        Id: 11131511932971975637
      }
    }
    Overrides {
      Name: "cs:10"
      AssetReference {
        Id: 15495812947899015931
      }
    }
    Overrides {
      Name: "cs:11"
      AssetReference {
        Id: 7997730331041590016
      }
    }
    Overrides {
      Name: "cs:12"
      AssetReference {
        Id: 6890919382649363793
      }
    }
    Overrides {
      Name: "cs:13"
      AssetReference {
        Id: 13820297575634285191
      }
    }
    Overrides {
      Name: "cs:14"
      AssetReference {
        Id: 1040389235858880330
      }
    }
    Overrides {
      Name: "cs:15"
      AssetReference {
        Id: 6706129283372581660
      }
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  Script {
    ScriptAsset {
      Id: 364180029738268491
    }
  }
}
Objects {
  Id: 14277736308585922196
  Name: "PIXELDEPTH_Equipment"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 7193685109751679562
  UnregisteredParameters {
    Overrides {
      Name: "cs:ffa_data"
      NetReference {
        Key: "b3c9efbde4cc4105b1fc83f2de888744"
        Type {
          Value: "mc:enetreferencetype:sharedpersistence"
        }
      }
    }
    Overrides {
      Name: "cs:PIXELDEPTH_API"
      AssetReference {
        Id: 16622261663679835299
      }
    }
    Overrides {
      Name: "cs:PIXELDEPTH_Weapons"
      AssetReference {
        Id: 13640537296973504035
      }
    }
    Overrides {
      Name: "cs:PIXELDEPTH_Perks"
      AssetReference {
        Id: 2163635863331147484
      }
    }
    Overrides {
      Name: "cs:weapon_assets"
      ObjectReference {
        SelfId: 4569329967828069285
      }
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  Script {
    ScriptAsset {
      Id: 9362961433814813585
    }
  }
}
