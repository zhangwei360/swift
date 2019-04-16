//
//  ViewController.swift
//  3-5自己练习
//
//  Created by JiaLidan on 2019/3/5.
//  Copyright © 2019 Zhangwei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    
        fileprivate func updateCollectionViewData(_ type: ListNaviBarItem) {
        
        if PHPhotoLibrary.authorizationStatus() != .authorized {
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.isHidden = true
                self?.emptyLabel.isHidden = false
            }
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            self?.dateList = []
            self?.videoAssets = []
            
            let fetchOptions = PHFetchOptions()
            fetchOptions.sortDescriptors = [ NSSortDescriptor(key: "creationDate", ascending: false) ]
            fetchOptions.predicate = NSPredicate(format: "mediaType = %d", PHAssetMediaType.video.rawValue)
            
            if type == .iem {
                let albumOptions = PHFetchOptions()
                albumOptions.predicate = NSPredicate(format: "title IN %@", ["Imaging Edge Mobile", "PlayMemories Mobile"])
                let albumList = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: albumOptions)
                for i in 0..<albumList.count {
                    let assets = PHAsset.fetchAssets(in: albumList[i], options: fetchOptions)
                    assets.enumerateObjects({ [weak self] (asset, index, stop) -> Void in
                        guard let weakSelf = self else {
                            return
                        }
                        
                        if let creationDate = asset.creationDate {
                            if let index = weakSelf.getDateIndex(creationDate) {
                                weakSelf.videoAssets[index].append(asset as PHAsset)
                            } else {
                                weakSelf.dateList.append(creationDate)
                                weakSelf.videoAssets.append([])
                                weakSelf.videoAssets[weakSelf.dateList.count-1].append(asset as PHAsset)
                            }
                        }
                    })
                }
            } else {
                fetchOptions.includeAssetSourceTypes = .init(rawValue: PHAssetSourceType.typeiTunesSynced.rawValue | PHAssetSourceType.typeUserLibrary.rawValue)
                let assets = PHAsset.fetchAssets(with: fetchOptions)
                assets.enumerateObjects({ [weak self] (asset, index, stop) -> Void in
                    guard let weakSelf = self else {
                        return
                    }
                    
                    if let creationDate = asset.creationDate {
                        if let index = weakSelf.getDateIndex(creationDate) {
                            weakSelf.videoAssets[index].append(asset as PHAsset)
                        } else {
                            weakSelf.dateList.append(creationDate)
                            weakSelf.videoAssets.append([])
                            weakSelf.videoAssets[weakSelf.dateList.count-1].append(asset as PHAsset)
                        }
                    }
                })
            }
            
            DispatchQueue.main.async { [weak self] in
                
                if self?.dateList.count ?? 0 > 0 {
                    self?.collectionView.reloadData()
                    self?.collectionView.scrollsToTop = true
                    self?.collectionView.isHidden = false
                    self?.emptyLabel.isHidden = true
                } else {
                    self?.collectionView.isHidden = true
                    self?.emptyLabel.isHidden = false
                }
            }
        }
    }
    
    

}

Crashed: com.apple.root.default-qos
0  FMW                            0x10058baf4 ListViewController.getDateIndex(_:) (<compiler-generated>)
1  FMW                            0x10058c77c closure #2 in closure #2 in ListViewController.updateCollectionViewData(_:) (ListViewController.swift:394)
2  FMW                            0x100517860 thunk for @escaping @callee_guaranteed (@guaranteed PHAsset, @unowned Int, @unowned UnsafeMutablePointer<ObjCBool>) -> () (<compiler-generated>)
3  CoreFoundation                 0x18f2d7cdc __NSArrayEnumerate + 412
4  Photos                         0x19dcef384 -[PHFetchResult enumerateObjectsUsingBlock:] + 80
5  FMW                            0x10058c588 closure #2 in ListViewController.updateCollectionViewData(_:) (<compiler-generated>)
6  FMW                            0x100556d30 thunk for @escaping @callee_guaranteed () -> () (<compiler-generated>)
7  libdispatch.dylib              0x18ed38a38 _dispatch_call_block_and_release + 24
8  libdispatch.dylib              0x18ed397d4 _dispatch_client_callout + 16
9  libdispatch.dylib              0x18ed1089c _dispatch_queue_override_invoke + 668
10 libdispatch.dylib              0x18ed1c9d4 _dispatch_root_queue_drain + 340
11 libdispatch.dylib              0x18ed1d248 _dispatch_worker_thread2 + 116
12 libsystem_pthread.dylib        0x18ef191b4 _pthread_wqthread + 464
13 libsystem_pthread.dylib        0x18ef1bcd4 start_wqthread + 4
