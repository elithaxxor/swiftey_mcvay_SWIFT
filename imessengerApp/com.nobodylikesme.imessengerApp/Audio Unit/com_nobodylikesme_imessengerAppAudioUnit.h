//
//  com_nobodylikesme_imessengerAppAudioUnit.h
//  com.nobodylikesme.imessengerApp
//
//  Created by a-robota on 5/17/22.
//

#import <AudioToolbox/AudioToolbox.h>
#import "com_nobodylikesme_imessengerAppDSPKernelAdapter.h"

// Define parameter addresses.
extern const AudioUnitParameterID myParam1;

@interface com_nobodylikesme_imessengerAppAudioUnit : AUAudioUnit

@property (nonatomic, readonly) com_nobodylikesme_imessengerAppDSPKernelAdapter *kernelAdapter;
- (void)setupAudioBuses;
- (void)setupParameterTree;
- (void)setupParameterCallbacks;
@end
