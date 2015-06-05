//
//  AnyAsyncSocket.m
//  
//  Wrapper of an AsyncSocket for AnyMesh
//  Originally created by Dan Parkhomenko June 4 2015.
//

#if ! __has_feature(objc_arc)
#warning This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif

#import "AsyncSocket+AnyMesh.h"
#import "MeshDeviceInfo.h"
#import <objc/runtime.h>
#import <sys/socket.h>

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

@implementation AsyncUdpSocket (AnyMeshHelper)

+ (void) togglePortReuseOption
{
    Method originalBindToAddressMethod = class_getInstanceMethod([self class], @selector(bindToAddress:port:error:));
    Method bindWithReuseMethod = class_getInstanceMethod([self class], @selector(bindToAddress:reusablePort:error:));
    method_exchangeImplementations(originalBindToAddressMethod, bindWithReuseMethod);
}

- (BOOL)bindToAddress:(NSString *)host reusablePort:(UInt16)port error:(NSError **)errPtr
{
    int reuseOn = 1;
    if (theSocket4)	setsockopt(CFSocketGetNative(theSocket4), SOL_SOCKET, SO_REUSEPORT, &reuseOn, sizeof(reuseOn));
    if (theSocket6)	setsockopt(CFSocketGetNative(theSocket6), SOL_SOCKET, SO_REUSEPORT, &reuseOn, sizeof(reuseOn));
    return [self bindToAddress:host reusablePort:port error:errPtr];
}

@end
