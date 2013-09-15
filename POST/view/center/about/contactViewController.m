//
//  aboutViewController.m
//  POST
//
//  Created by Arie on 9/13/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "contactViewController.h"

@interface contactViewController ()

@end

@implementation contactViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		NSString *html=@"<html><style type=text/css>body{width: 100%;font-family: HelveticaNeue;color: #fff;background: #303741;}.right{width: 60%;text-align: justify;}.right p{font-size: 13px;}</style><body><div class='right'><p>Panin Sekuritas merupakan salah satu Perusahaan Efek terkemuka yang hadir untuk menjawab kebutuhan investasi para Investor, baik perorangan, perusahaan swasta, maupun lembaga pemerintahan. Solusi cerdas yang kami berikan didasari oleh pengetahuan yang mendalam atas kebutuhan investasi para Nasabah kami.</p><p>Panin Sekuritas berkomitmen untuk untuk melebarkan sayap pelayanannya kepada Nasabah melalui media internet. Dalam era keuangan global dan revolusi teknologi, Perusahaan kami akan tetap berinovasi, baik dari segi pengetahuan maupun ketrampilan teknis serta dalam berbagai sisi kegiatan usaha. Manajemen dan staf kami yang berpengalaman di bidangnya dengan bangga melayani segala kebutuhan investasi para Nasabah.</p></div><div class='left'></div></body></html>";
        // Custom initialization
		self.view.backgroundColor = [UIColor whiteColor];
		
		webview =[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 1024, 768-44)];
		webview.delegate = self;
		[webview loadHTMLString:html baseURL:nil];
		webview.scrollView.bounces = NO; 
		[self.view addSubview:webview];
    }
	
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:YES];
	[self initnavbar];
}
-(void)initnavbar{
	UIView *buy_sell=[[UIView alloc]initWithFrame:CGRectMake(1024-300, 0, 300, 44)];
	[buy_sell setBackgroundColor:[UIColor clearColor]];
	[self.navigationController.navigationBar addSubview:buy_sell];
	
	UIButton *buy = [UIButton buttonWithType:UIButtonTypeCustom];
	buy.frame = CGRectMake(70, 0, 100, 44);
	buy.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"buy"]];
	[buy setBackgroundImage:[UIImage imageNamed:@"buy"] forState:UIControlStateNormal];
	[buy setBackgroundImage:[UIImage imageNamed:@"buy_"] forState:UIControlStateHighlighted];
	
	UIButton *sell = [UIButton buttonWithType:UIButtonTypeCustom];
	sell.frame = CGRectMake(190, 0, 100, 44);
	sell.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"sell"]];
	[sell setBackgroundImage:[UIImage imageNamed:@"sell"] forState:UIControlStateNormal];
	[sell setBackgroundImage:[UIImage imageNamed:@"sell_"] forState:UIControlStateHighlighted];
	
	
	[buy_sell addSubview:buy];
	[buy_sell addSubview:sell];
	
	navLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, -2, 220, 18)];
	navLabel.backgroundColor = [UIColor clearColor];
	navLabel.textColor = [UIColor whiteColor];
	navLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:16];
	navLabel.textAlignment = NSTextAlignmentCenter;
	navLabel.text = @"CONTACT US";
	self.navigationItem.titleView = navLabel;
	
	
	//self.titleImage=[[UIImageView alloc]initWithFrame:CGRectMake(3, 0, 142, 24.5)];
	//[self.titleImage setImage:[UIImage imageNamed:@"topChart"]];
	
	//selectedCellIndexPath=[[NSIndexPath alloc]init];
	
	UIImage* image = [UIImage imageNamed:@"right"];
	CGRect frame = CGRectMake(0, 0, 44, 44);
	UIButton* leftbutton = [[UIButton alloc] initWithFrame:frame];
	[leftbutton setBackgroundImage:image forState:UIControlStateNormal];
	//[leftbutton setBackgroundImage:[UIImage imageNamed:@"left-push"] forState:UIControlStateHighlighted];
	[leftbutton addTarget:self action:@selector(lefbuttonPush) forControlEvents:UIControlEventTouchUpInside];
	
	UIView *leftbuttonView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
	leftbuttonView.backgroundColor=[UIColor clearColor];
	[leftbuttonView addSubview:leftbutton];
	UIBarButtonItem* leftbarbutton = [[UIBarButtonItem alloc] initWithCustomView:leftbuttonView];
	
	[self.navigationItem setLeftBarButtonItem:leftbarbutton];
}
-(void)buy{
	
}
-(void)sell{
	
}
@end
