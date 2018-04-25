//
//  BCCollectionViewHorizontalLayout.h
//  Sanjieyou
//
//  Created by 王佳敏 on 2018/4/11.
//  Copyright © 2018年 王佳敏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCCollectionViewHorizontalLayout : UICollectionViewFlowLayout
@property (nonatomic) NSUInteger itemCountPerRow;
// 一页显示多少行
@property (nonatomic) NSUInteger rowCount;
@property (strong, nonatomic) NSMutableArray *allAttributes;
@end
