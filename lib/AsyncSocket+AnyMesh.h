//
//  AsyncSocket+AnyMesh.h
//  
//  Wrapper of an AsyncSocket for AnyMesh
//  Originally created by Dan Parkhomenko June 4 2015.
//

#import <Foundation/Foundation.h>
#import "AsyncSocket.h"
#import "AsyncUdpSocket.h"

@class MeshDeviceInfo;

@interface AsyncSocket (AnyMeshHelper)

@property (nonatomic, getter = getDeviceInfo, setter = setDeviceInfo:) MeshDeviceInfo *deviceInfo;

@end

@interface AsyncUdpSocket (AnyMeshHelper) //1: AsyncUdpSocket// (AnyMeshHelper)

+ (void)togglePortReuseOption;

@end
