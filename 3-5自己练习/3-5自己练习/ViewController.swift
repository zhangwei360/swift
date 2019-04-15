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

