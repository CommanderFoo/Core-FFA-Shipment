Assets {
  Id: 3962095408049356442
  Name: "Container Open Full Blue"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 12720631693511965620
      Objects {
        Id: 12720631693511965620
        Name: "Container Open Full Blue"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 15597830383730082089
        ChildIds: 9480480971406158588
        ChildIds: 16878440783731634879
        ChildIds: 11605735574659647485
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        Folder {
          IsGroup: true
        }
      }
      Objects {
        Id: 15597830383730082089
        Name: "Whitebox Floor 01 8m x 8m"
        Transform {
          Location {
            X: -497.286621
            Y: -7.75646973
            Z: -5.06202698
          }
          Rotation {
            Roll: -179.999954
          }
          Scale {
            X: 1.13354969
            Y: 0.458607048
            Z: 0.400000036
          }
        }
        ParentId: 12720631693511965620
        UnregisteredParameters {
          Overrides {
            Name: "ma:Building_Floor:id"
            AssetReference {
              Id: 7920059616643609212
            }
          }
          Overrides {
            Name: "ma:Building_Ceiling:color"
            Color {
              R: 0.603827536
              G: 0.577580631
              B: 1
              A: 1
            }
          }
          Overrides {
            Name: "ma:Building_Ceiling:id"
            AssetReference {
              Id: 7920059616643609212
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CoreMesh {
          MeshAsset {
            Id: 13021171953797967755
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          EnableCameraCollision: true
          StaticMesh {
            Physics {
            }
          }
        }
      }
      Objects {
        Id: 9480480971406158588
        Name: "Shipping Container Side 6m"
        Transform {
          Location {
            X: 400
            Y: 357.673248
            Z: -0.0504150391
          }
          Rotation {
            Yaw: 90.0000153
          }
          Scale {
            X: 0.7
            Y: 1.49999988
            Z: 0.7
          }
        }
        ParentId: 12720631693511965620
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 7920059616643609212
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.603827536
              G: 0.577580631
              B: 1
              A: 1
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CoreMesh {
          MeshAsset {
            Id: 4451675930926468223
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          EnableCameraCollision: true
          StaticMesh {
            Physics {
            }
          }
        }
      }
      Objects {
        Id: 16878440783731634879
        Name: "Shipping Container Side 6m"
        Transform {
          Location {
            X: 400
            Y: -12.0334473
            Z: 400
          }
          Rotation {
            Pitch: -90
            Roll: 90.0000076
          }
          Scale {
            X: 0.699999154
            Y: 1.50059593
            Z: 0.6
          }
        }
        ParentId: 12720631693511965620
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 7920059616643609212
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.604793549
              G: 0.578000069
              B: 1
              A: 1
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CoreMesh {
          MeshAsset {
            Id: 4451675930926468223
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          EnableCameraCollision: true
          StaticMesh {
            Physics {
            }
          }
        }
      }
      Objects {
        Id: 11605735574659647485
        Name: "Shipping Container Side 6m"
        Transform {
          Location {
            X: -500
            Z: -0.0504150391
          }
          Rotation {
            Yaw: -90
          }
          Scale {
            X: 0.7
            Y: 1.49999988
            Z: 0.7
          }
        }
        ParentId: 12720631693511965620
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 7920059616643609212
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.603827536
              G: 0.577580631
              B: 1
              A: 1
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CoreMesh {
          MeshAsset {
            Id: 4451675930926468223
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          EnableCameraCollision: true
          StaticMesh {
            Physics {
            }
          }
        }
      }
    }
    Assets {
      Id: 13021171953797967755
      Name: "Whitebox Floor 01 8m x 8m"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_ts_gen_whitebox_floor_001_8x8"
      }
    }
    Assets {
      Id: 7920059616643609212
      Name: "Metal Basic 01"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_metal_basic_001"
      }
    }
    Assets {
      Id: 4451675930926468223
      Name: "Shipping Container Side 6m"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_wall_shipping_container_6m_001"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 65
}
