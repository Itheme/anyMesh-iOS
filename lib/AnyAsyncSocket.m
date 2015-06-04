//
//  AnyAsyncSocket.m
//  
//  Wrapper of an AsyncSocket for AnyMesh
//  Originally created by Dan Parkhomenko June 4 2015.
//

#if ! __has_feature(objc_arc)
#warning This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif

#import "AnyAsyncSocket.h"
#import "MeshDeviceInfo.h"
#import <objc/runtime.h>

@implementation AsyncSocket (AnyMeshHelper)

@dynamic deviceInfo;

static char *kDeviceInfoKey = "device_info";

- (MeshDeviceInfo *) getDeviceInfo
{
    return objc_getAssociatedObject(self, kDeviceInfoKey);
}

- (void) setDeviceInfo:(MeshDeviceInfo *)deviceInfo
{
    objc_setAssociatedObject(self, kDeviceInfoKey, deviceInfo, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
