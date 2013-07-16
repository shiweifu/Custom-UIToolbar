//
//  MainViewController.m
//  toolbar
//
//  Created by Mariya Starchevska on 9/5/11.
//  Copyright 2011. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

-(void)DisplayAlertWithText:(NSString*)text
{
    [[[[UIAlertView alloc]initWithTitle:@"Test" message:[NSString stringWithFormat:@"%@ selected", text] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]autorelease]show];
}

-(void)FirstButtonPressed
{
    [self DisplayAlertWithText:@"grapefruit"];
}

-(void)SecondButtonPressed
{
    [self DisplayAlertWithText:@"kiwi"];
}

-(void)ThirdButtonPressed
{
    [self DisplayAlertWithText:@"watermelon"];
}

-(void)FourthButtonPressed
{
    [self DisplayAlertWithText:@"lime"];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    float toolbarHeight = 44.0;
    
    //Create custom toolbar with given frame and custom background color
    
    myToolbar = [[CustomToolbar alloc]initWithFrame:CGRectMake(0.0, self.view.frame.size.height - toolbarHeight, self.view.frame.size.width, toolbarHeight) 
                                                AndBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"toolbar_bg.png"]]];
    [self.view addSubview:myToolbar];
    
    //Add toolbar buttons
    
    [myToolbar AddToolbarItemWithImage:[UIImage imageNamed:@"grapefruit.png"] Target:self Selector:@selector(FirstButtonPressed)];
    [myToolbar AddToolbarItemWithImage:[UIImage imageNamed:@"kiwi.png"] Target:self Selector:@selector(SecondButtonPressed)];
    [myToolbar AddToolbarItemWithImage:[UIImage imageNamed:@"watermelon.png"] Target:self Selector:@selector(ThirdButtonPressed)];
    [myToolbar AddToolbarItemWithImage:[UIImage imageNamed:@"lime.png"] Target:self Selector:@selector(FourthButtonPressed)];
    
    
    //enable/disable buttons:
    //[myToolbar ButtonAtIndex:1 SetEnabled:NO];
    
    //remove button:
    //[myToolbar RemoveButtonAtIndex:1];
    
    [myToolbar release];
    
    
    UIButton *btnRemove = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnRemove setTitle:@"remove" forState:UIControlStateNormal];
    CGRect r = CGRectMake(100.0f, 70.0f, 70.0f, 50.0f);
    [btnRemove setFrame:r];
    
    [self.view addSubview:btnRemove];
//    [btn release];
    [btnRemove addTarget:self action:@selector(onButton) forControlEvents:UIControlEventTouchUpInside];
    
     UIButton *btnAddImage = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnAddImage setTitle:@"addImage" forState:UIControlStateNormal];
    r = CGRectMake(100.0f, 300.0f, 70.0f, 50.0f);
    [btnAddImage setFrame:r];
    
    [self.view addSubview:btnAddImage];
//    [btn release];
    [btnAddImage addTarget:self action:@selector(onButtonAddImage) forControlEvents:UIControlEventTouchUpInside];
        
    UIButton *btnAdd = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnAdd setTitle:@"addLabel" forState:UIControlStateNormal];
    r = CGRectMake(100.0f, 200.0f, 70.0f, 50.0f);
    [btnAdd setFrame:r];
    
    [self.view addSubview:btnAdd];
//    [btn release];
    [btnAdd addTarget:self action:@selector(onButtonAdd) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIButton *btnAddFlex = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnAddFlex setTitle:@"addLabelFlex" forState:UIControlStateNormal];
    r = CGRectMake(200.0f, 200.0f, 100.0f, 50.0f);
    [btnAddFlex setFrame:r];
    
    [self.view addSubview:btnAddFlex];
//    [btn release];
    [btnAddFlex addTarget:self
               action:@selector(onAddFlex)
     forControlEvents:UIControlEventTouchUpInside];
    
}


- (IBAction) onAddFlex
{
    
    [myToolbar AddFixedSpaceToolbarItem];
}



- (IBAction) onButton
{
    NSLog(@"hello");
    [myToolbar RemoveButtonAtIndex:0];
}


- (IBAction) onButtonAddImage
{
//    NSLog(@"helloAdd");
    [myToolbar AddToolbarItemWithImage:[UIImage imageNamed:@"watermelon.png"] Target:self Selector:@selector(onCustomItem)];
//    [myToolbar AddFixedSpaceToolbarItem];
//    [myToolbar RemoveButtonAtIndex:0];
}

- (IBAction) onButtonAddFlex
{
//    NSLog(@"helloAdd");
//    [myToolbar AddToolbarItemWithImage:[UIImage imageNamed:@"watermelon.png"] Target:self Selector:@selector(onCustomItem)];
//    [myToolbar RemoveButtonAtIndex:0];
    
    [myToolbar AddToolbarItemLabelWithText:@"hello" color:[UIColor whiteColor]];
}

- (IBAction) onButtonAdd
{
//    NSLog(@"helloAdd");
//    [myToolbar AddToolbarItemWithImage:[UIImage imageNamed:@"watermelon.png"] Target:self Selector:@selector(onCustomItem)];
//    [myToolbar AddFixedSpaceToolbarItem];
//    [myToolbar RemoveButtonAtIndex:0];
    
    [myToolbar AddToolbarItemLabelWithText:@"hello" color:[UIColor whiteColor]];
}

- (IBAction) onCustomItem
{
    NSLog(@"on custom item");
}
//
//- (IBAction) onAddLabel
//{
//    NSLog(@"on custom item");
//}
//     

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;//(interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
