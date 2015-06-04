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

@implementation AsyncSocket (AnyMeshHelper)

@dynamic deviceInfo;

//// Designated initializer.
//- (id)initWithDelegate:(id)delegate userData:(long)userData
//{
//	if((self = [super initWithDelegate:delegate userData:userData]))
//	{
//        self.deviceInfo = [[MeshDeviceInfo alloc] init];
//	}
//	return self;
//}

@end
