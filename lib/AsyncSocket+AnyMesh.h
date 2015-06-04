//
//  AsyncSocket+AnyMesh.h
//  
//  Wrapper of an AsyncSocket for AnyMesh
//  Originally created by Dan Parkhomenko June 4 2015.
//

#import <Foundation/Foundation.h>
#import "AsyncSocket.h"

@class MeshDeviceInfo;

@interface AsyncSocket (AnyMeshHelper)

@property (nonatomic, getter = getDeviceInfo, setter = setDeviceInfo:) MeshDeviceInfo *deviceInfo;

@end
