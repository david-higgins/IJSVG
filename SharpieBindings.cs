using System;
using System.Runtime.InteropServices;
using AppKit;
using CoreGraphics;
using Foundation;
// using IJSVG;
// using ObjCRuntime;

// using System.Xml;


namespace IJSVG
{
	// @interface IJSVG : NSObject <NSPasteboardWriting>
	[BaseType (typeof(NSObject))]
	interface IJSVG// : INSPasteboardWriting
	{
		// -(id)initWithFile:(NSString *)file;
		[Export ("initWithFile:")]
		IntPtr Constructor (string file);

		// -(id)initWithFile:(NSString *)file error:(NSError **)error;
		[Export ("initWithFile:error:")]
		IntPtr Constructor (string file, out NSError error);

		// -(id)initWithFile:(NSString *)file delegate:(id<IJSVGDelegate>)delegate;
		// [Export ("initWithFile:delegate:")]
		// IntPtr Constructor (string file, IJSVGDelegate d);

		// -(id)initWithFile:(NSString *)file error:(NSError **)error delegate:(id<IJSVGDelegate>)delegate;
		// [Export ("initWithFile:error:delegate:")]
		// IntPtr Constructor (string file, out NSError error, IJSVGDelegate d);

		// -(id)initWithFilePathURL:(NSURL *)aURL;
		[Export ("initWithFilePathURL:")]
		IntPtr Constructor (NSUrl aURL);

		// -(id)initWithFilePathURL:(NSURL *)aURL error:(NSError **)error;
		[Export ("initWithFilePathURL:error:")]
		IntPtr Constructor (NSUrl aURL, out NSError error);

		// -(id)initWithFilePathURL:(NSURL *)aURL delegate:(id<IJSVGDelegate>)delegate;
		// [Export ("initWithFilePathURL:delegate:")]
		// IntPtr Constructor (NSUrl aURL, IJSVGDelegate d);

		// -(id)initWithFilePathURL:(NSURL *)aURL error:(NSError **)error delegate:(id<IJSVGDelegate>)delegate;
		// [Export ("initWithFilePathURL:error:delegate:")]
		// IntPtr Constructor (NSUrl aURL, out NSError error, IJSVGDelegate d);

		// -(NSImage *)imageWithSize:(NSSize)aSize;
		[Export ("imageWithSize:")]
		NSImage ImageWithSize (CGSize aSize);

		// -(NSImage *)imageWithSize:(NSSize)aSize error:(NSError **)error;
		[Export ("imageWithSize:error:")]
		NSImage ImageWithSize (CGSize aSize, out NSError error);

		// -(NSImage *)imageWithSize:(NSSize)aSize flipped:(BOOL)flipped;
		[Export ("imageWithSize:flipped:")]
		NSImage ImageWithSize (CGSize aSize, bool flipped);

		// -(BOOL)drawInRect:(NSRect)rect;
		[Export ("drawInRect:")]
		bool DrawInRect (CGRect rect);

		// -(BOOL)drawInRect:(NSRect)rect error:(NSError **)error;
		[Export ("drawInRect:error:")]
		bool DrawInRect (CGRect rect, out NSError error);

	}
}
