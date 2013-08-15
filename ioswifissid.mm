//
//  ioswifissid.mm
//  ioswifissid
//
//  Created by Nakia Brewer on 15/07/13.
//  Copyright 2013 Nakia Brewer. All rights reserved.
//
#import <SystemConfiguration/CaptiveNetwork.h>
#import <Foundation/Foundation.h>



NSString * currentWifiSSID (void)

{
    // Does not work on the simulator.
    NSString *ssid = nil;
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    for (NSString *ifnam in ifs)
    {
        NSDictionary *info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        ssid = [info objectForKey:@"SSID"];
        if (ssid)
            break;
    }
    return ssid ? ssid : @"";
}


